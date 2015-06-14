# Day 13

## Naming and Reorganization

After sleeping on it, I don’t want to hide the page objects under the `features` directory.  I also know that there are non-rspec-specific helpers under `rspec` which are setting up data and canned responses, and some of the other cukes are starting to require rspec to get access to them, so let’s create a new top-level directory, `test_commons` (named so that when you’re looking through the directory list looking for app code it’s clearly test-related).  We can envisage subdirectories for `data_setup` and `mock_responses`, but for now let’s just add a `page_objects` subdirectory.

I’ve seen two approaches to including the result (both here slightly customized), one from Robbie Clutton and Matt Parker’s LA Ruby Conference 2013 [talk](http://confreaks.tv/videos/larubyconf2013-it-s-not-your-test-framework-it-s-you):

```ruby
# assume everything under test_commons/page_objects is in a PageObjects module, then

# rspec
RSpec.configure do |c|
  c.include PageObjects, type: [:feature, :request]
end

# cucumber
World PageObjects
```

and one from Panayotis Matsinopoulos’s useful [blog post](http://pmatsinopoulos.github.io/blog/2014/09/21/you-dont-have-to-be-afraid-to-test-your-ui-page-object-pattern-to-the-rescue/):

```ruby
# add a test_commons/page_objects/include_all.rb file:
current_path = File.expand_path('..', __FILE__)
Dir.glob(File.join(current_path, '**', '*.rb')).each do |f|
  require f
end

# and then require it in both features/support/env.rb and spec_helper.rb
```

Because we’ve put the files in a non-standard directory, we’ll need bits of both.

First, let’s move yesterday’s `PageObjectHelpers` into `test_commons/page_objects/loader.rb`, changing the module to `PageObjects` and leaving out the `World(PageObjectHelpers)` line.

Then let’s move `features/page_objects/login_page.rb` into `test_commons/page_objects`, and since `PageObjects::LoginPage` is chiastic but repetitive, let’s make it `PageObjects::Login` at `test_commons/page_objects/login.rb`.  We’ll need to modify `visit_page` accordingly:

```ruby
# test_commons/page_objects/login.rb
module PageObjects
  class Login < SitePrism::Page
  …

# test_commons/page_objects/loader.rb:
module PageObjects
  def visit_page(page_name, &block)
    Object.const_get("PageObjects::#{page_name.capitalize}").new.tap do |page|
      page.load
      block.call page if block
    end
  end
end
```

For the wiring, let’s create a `test_commons/all_page_objects.rb` file with:

```ruby
page_objects_path = File.expand_path('../page_objects', __FILE__)
Dir.glob(File.join(page_objects_path, '**', '*.rb')).each do |f|
  require f
end
```

and then in `features/support/env.rb` let’s add

```ruby
require_relative '../../test_commons/all_page_objects' # gives us access to page object classes
World(PageObjects) # gives us access to module methods like visit_page
```

And then our smoke login scenario passes again.

Was that reorganization worth it?  For page objects on their own, if you're certain they’re only ever going to be used in either cucumber scenarios or rspec features, possibly not, because you could get the `all_page_objects` behaviour for free by putting them under `features` or `spec`.  But in the context of a larger project where there are other categories of shared functionality between specs and cukes, it feels like a useful model to have worked out, and much clearer than, say, putting `require 'spec/support'` in `features/support/env.rb`.
