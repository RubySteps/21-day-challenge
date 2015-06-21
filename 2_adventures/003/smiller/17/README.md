# Day 17

## Further page object thoughts: should visit_page be deprecated?

Continuing to ponder Searls’s talk from yesterday, if we accept that SAFE tests should interact as the end-user would with the UI as much as possible, this suggests that `visit_page` should perhaps, after going to the first page, be deprecated in favour of

```ruby
on_page(:with_navigation).goto_component_one
on_page('ComponentOne::StepOne').do_step(@unit.needed_value)
```

There are two additional programming-by-wishful-thinking points here.

One, since for different subsystems we’ll want to namespace the page objects, like so:

```ruby
# test_commons/page_objects/component_one/step_one.rb
module PageObjects
  module ComponentOne
    class StepOne < SitePrism::Page
      def do_step(value)
        …
```

we’ll want to make the `build_page` method a bit cleverer to understand both symbols and qualified forms like `ComponentOne::StepOne`:

```ruby
# from test_commons/page_objects/helpers.rb
def build_page(name)
  name = name.to_s.camelize if name.is_a? Symbol
  Object.const_get("PageObjects::#{name}").new
end
```

(yes, `camelize` is ActionSupport only, but we’re in a Rails project so we might as well use it.)

Two, in the first line, we’re using shorthand for “on a page which has the navigation section”.  Can we call that just on the section?  Does `be_displayed` function or fall over in that case?  If we can’t, do we want an alternate implementation of `on_page` where we aren’t doing the `expect(page).to be_displayed(args)` check, so our interface turns into `visit_page`, `on_page`, and `assert_on_page`?  Further investigation is required here.

(A third point about how we check the `visit_page` functionality of the user just typing an address in a browser: that can be caught by lower-level routing tests, and doesn’t need to be at the cuke level at all.  Though the design of a common test item to handle both UI interaction and routes just got more complicated.  More investigation needed there too.)
