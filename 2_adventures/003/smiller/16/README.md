# Day 16

## Back to Page Objects

So, having logged in back on Day 14 (and continuing to lightly fictionalize), one of the things “Bob” should see on the dashboard is the subset of components he is authorized to interact with in the navigation menu.  The navigation menu is on every page, not just the dashboard, so let’s represent it as a site_prism section.

```ruby
# test_commons/page_objects/dashboard.rb
module PageObjects
  class Dashboard < SitePrism::Page
    set_url_matcher %r{/dashboard}

    section :navigation, NavigationSection, ".navigation"
  end
end

# test_commons/page_objects/navigation_section.rb
module PageObjects
  class NavigationSection < SitePrism::Section
    element :component_one, "a.component_one"
    element :component_two, "a.component_two"
	element :component_three, "a.component_three"

    def goto_one
      component_one.click
    end

    def goto_two
      component_two.click
    end

    def goto_three
      component_three.click
    end
  end
end
```

[Sidebar: I just watched Justin Searls’s excellent Ancient City Ruby 2014 [talk](https://www.youtube.com/watch?v=vkAfGHd7sZY) “Breaking Up (With) Your Test Suite”, and his comment that in SAFE tests you should be interacting as much as possible with the actual words the user sees on the screen and not the css is hard to refute.  To guard against the fragility counter-argument I would make sure all user-facing text was in an i18n file and use the keys from there in the tests so that wording changes would be picked up seamlessly.]

Let’s suppose that Bob was set up as a client user who should be able to see components one and two, but not three.  We could reopen `Then Bob is on the dashboard` and test it there:

```ruby
Then(/^Bob is on the dashboard$/) do
  on_page(:dashboard).do |page|
    expect(page.navigation).to have_component_one
    expect(page.navigation).to have_component_two
    expect(page.navigation).not_to have_component_three
  end
end
```

But since we’ll probably want those three assertions elsewhere, it would be nice if we could say instead

```ruby
Then(/^Bob is on the dashboard$/) do
  on_page(:dashboard).do |page|
    expect(page.navigation).to show_only_client_user_links
  end
end
```

We could put the `show_only_client_user_links` method in the page object itself, though there is lively debate about this (see [here](http://martinfowler.com/bliki/PageObject.html), [here](http://blog.thepete.net/blog/2013/09/13/assertions-in-page-objects/), and [here](http://techie-notebook.blogspot.ca/2014/01/using-capybara-and-rspec-assertions-in.html)), and in this case the behaviour is more related to the client user permissions than to the page, so I’d rather not.  The next simplest thing we could do is push it out into another RSpec Custom Matcher, which also gives us better error messaging:

```ruby
# spec/support/matchers/show_only_client_user_links.rb
RSpec::Matchers.define :show_only_client_user_links do |args|
  match do |actual|
    actual.has_component_one? && actual.has_component_two? && !actual.has_component_three?
  end

  failure_message_for_should do |actual|
    showed = []
    showed << "one" if actual.has_component_one?
    showed << "two" if actual.has_component_two?
    showed << "three" if actual.has_component_three?
    "expected to show only components one and two, but showed instead #{showed}."
  end
end
```

This handles the test of the visible component links, though continuing to program by wishful thinking a method on the page object that returned the visible component links would have simplified the custom matcher code.

But suppose you also want to test that Bob the client user can’t type the URL for component three in the browser address bar and get in that way?  It feels like a separate permissions-under-test object that addresses both the links that should be visible (which would also simplify the custom matcher) and the URLs that should be accessible would be useful.  Something to explore next.
