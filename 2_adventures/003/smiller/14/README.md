# Day 14

## But Did We Actually Log In?

Lightly fictionalized, this is what we have so far for the smoke login test:

```ruby
# features/login.feature
Feature: login

  Scenario: login
    Given Bob exists
    When Bob logs in
```

```ruby
# features/step_definitions/login_steps.rb
Given(/^Bob exists$/) do
  FactoryGirl.create(:user, login: 'bob@test.com')
end

When(/^Bob logs in$/) do
  visit_page(:login).logs_in('bob@test.com')
end
```

```ruby
# test_commons/page_objects/login.rb
module PageObjects
  class Login < SitePrism::Page
    set_url '/'

    element :login, 'input#login'
    element :password, 'input#password'
    element :submit, "input[name='commit']"

    def logs_in(login_value, password_value = 'secret')
      login.set login_value
      password.set password_value
      submit.click
    end
  end
end
```

### What It Does

This will fail informatively if any of the fields are missing:

```ruby
When I log in
  Unable to find css "input#login" (Capybara::ElementNotFound)
```

so if it passes, we know all the fields are on the page and can be interacted with.

### What It Doesn’t Do

We don’t know if “Bob” has actually logged in.  Suppose on logging in Bob should go to a dashboard page, with a URL of `/dashboard#extra-parameters=stuff`.

### How To Make It Do That

We can model this (after looking at site_prism’s documentation for [#set_url](https://github.com/natritmeyer/site_prism#adding-a-url) and [#set_url_matcher](https://github.com/natritmeyer/site_prism#falling-back-to-basic-regexp-matchers)) as:

```ruby
Then Bob is on the dashboard
```

```ruby
Then(/^Bob is on the dashboard$/) do
  on_page(:dashboard)
end
```

```ruby
# test_commons/page_objects/dashboard.rb
module PageObjects
  class Dashboard < SitePrism::Page
    set_url_matcher %r{/dashboard}
  end
end
```

which suggests that in a perfect world PageObjects would have an `on_page` method that doesn’t load the page but that does verify that we’re on the page we expect to be on.

Let’s open `test_commons/page_objects/loader.rb` (and probably rename it `test_commons/page_objects/helpers.rb`, because `on_page` isn’t a loader), and start writing the code we wish we had, after looking at site_prism’s documentation and noting the [#displayed?](https://github.com/natritmeyer/site_prism#verifying-that-a-particular-page-is-displayed) method:

```ruby
  def on_page(page_name, &block)
    Object.const_get("PageObjects::#{page_name.capitalize}").new.tap do |page|
      expect(page).to be_displayed
      block.call page if block
    end
  end
```

That actually does the trick, and passes if and only if the next page has a URL matching `/dashboard`.

### More Informative Errors

Suppose we end up on a page with the URL `/secondary-control-room` instead.  How does the scenario fail?

```ruby
Then Bob is on the dashboard
  expected displayed? to return true, got false (RSpec::Expectations::ExpectationNotMetError)
  ./test_commons/page_objects/helpers.rb:11:in `block in on_page'
```

The error message would be more useful if it said something like “expected to be on page ‘dashboard’, was on ‘/secondary-control-room’”.  (Site_prism has a [#current_url](https://github.com/natritmeyer/site_prism#getting-the-current-pages-url) method that gives us the actual value.)  Feels like an RSpec Custom Matcher problem, though the shortest first step would be to precede the `expect(page).to be_displayed` check with

```ruby
expect(page.current_path).to match(page.url_matcher || page.url)
```

which provides the more informative error message of

```ruby
Then Bob is on the dashboard
  expected "/secondary-control-room" to match /\/dashboard/
  Diff:
  @@ -1,2 +1,2 @@
  -/\/dashboard/
  +"/secondary-control-room"
  (RSpec::Expectations::ExpectationNotMetError)
```

It might make sense to leave it at that for now, because I haven’t explored site_prism’s [parameterized URLs](https://github.com/natritmeyer/site_prism#parameterized-urls), such that we probably would have wanted to do something more like

```ruby
set_url "/dashboard{?#extra-parameters=*}"
```

and the fact that you can then do things like, say (from the [README](https://github.com/natritmeyer/site_prism#navigating-to-a-page-with-a-parameterized-url)):

```ruby
class UserProfile < SitePrism::Page
  set_url "/users{/username}"
end

@user_profile = UserProfile.new
@user_profile.load #=> /users
@user_profile.load(username: 'bob') #=> loads /users/bob
```

also suggests that I’m going to want to pass another argument into `visit_page` for optional arguments to the `page.load` call.

### Postscript: RSpec Custom Matcher

A few hours later, I’m not comfortable leaving that fragile expectation in.  Let’s build the RSpec custom matcher after all.  Revert `on_page` to just check `expect(page).to be_displayed`, and then, after checking the [official rspec-expectations docs](https://www.relishapp.com/rspec/rspec-expectations/v/2-4/docs/custom-matchers/define-matcher) and Daniel Chang’s [additional notes](http://danielchangnyc.github.io/blog/2014/01/15/tdd2-RSpecMatchers/), add:

```ruby
# spec/support/matchers/be_displayed.rb
RSpec::Matchers.define :be_displayed do |args|
  match do |actual|
    actual.displayed?(args)
  end

  failure_message_for_should do |actual|
    expected = actual.class.to_s.sub(/PageObjects::/, '')
    expected += " (args: #{args})" if args.count > 0
    "expected to be on page '#{expected}', but was on #{actual.current_path}"
  end
end
```

Since we’re running it from cucumber, we need to require it explicitly in `features/support/env.rb`:

```ruby
require_relative '../../spec/support/matchers/be_displayed'
```

The first time we run it, we hit a weird error

```ruby
Then Bob is on the dashboard
  comparison of Float with nil failed (ArgumentError)
  ./spec/support/matchers/be_displayed.rb:3:in `block (2 levels) in <top (required)>'
```

which debugging into site_prism’s `#displayed?` method suggests is a problem of passing nil instead of an empty Hash.  We can fix that from the `on_page` method:

```ruby
def on_page(page_name, args = {}, &block)
  Object.const_get("PageObjects::#{page_name.capitalize}").new.tap do |page|
    expect(page).to be_displayed(args)
    block.call page if block
  end
end
```

With that change, we now get

```ruby
Then Bob is on the dashboard
  expected to be on page 'Dashboard', but was on '/secondary-control-room' (RSpec::Expectations::ExpectationNotMetError)
  ./test_commons/page_objects/helpers.rb:11:in `block in on_page'
```

We aren’t passing in any parameters to the URL yet, but when we start, it will just work.

### Postscript 2:

It is the case, looking at `test_commons/page_objects/helpers.rb`:

```ruby
module PageObjects
  def visit_page(page_name, args = {}, &block)
    Object.const_get("PageObjects::#{page_name.capitalize}").new.tap do |page|
      page.load(args)
      block.call page if block
    end
  end

  def on_page(page_name, args = {}, &block)
    Object.const_get("PageObjects::#{page_name.capitalize}").new.tap do |page|
      expect(page).to be_displayed(args)
      block.call page if block
    end
  end
end
```

that we have two methods that are the same except for one line, which we could refactor into a common method which yields to either `page.load(args)` or `expect(page).to be_displayed(args)`.  I’m inclined to leave it for now, but if we add a third method following the same template, we should definitely refactor then.
