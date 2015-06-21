# Day 20

## Page flows

It becomes increasingly clear that I really needed a fully-worked and accessible github repo for this.  Next time.

```ruby
test_commons
- page_objects
  - component_one
    - page_one
    - page_two
  - component_two
    - page_one
    - page_two
    - page_three
```

Suppose one of the flows through component one involves a side-trip through component two.  And you’ve got a separate test that exercises component two, so really you just want something that passes through component two without breaking anything.  It would be to have a `flows.rb` file in the `component_two` directory, and then in `PageObjects::ComponentTwo::Flows` you can have a `pass_through` method that goes through all the pages, putting in safe inputs.

For any inputs that we need to specify, we can pass in a hash of inputs, with the names of the elements they refer to, and ewe’ll grab them in the actual page objects via fetch and pass in the default safe inputs if there’s no supplied specific input.

```ruby
module PageObjects
  module ComponentTwo
    module Flows

      def pass_through(inputs)
        on_page('ComponentTwo::PageOne').pass_through(inputs[:page_one])
        on_page('ComponentTwo::PageTwo').pass_through(inputs[:page_two])
        on_page('ComponentTwo::PageThree').pass_through(inputs[:page_three])
      end

    end
  end
end
```

We’d want to experiment about putting “navigate to beginning of component two flow” in the `pass_through` or not.  It probably depends on how we get to component two from component one.  If it’s an integral part of the flow, we won’t need one.  If the user needs to navigate into component two, maybe we need a wrapping method `navigate_to_and_pass_through` as well as “just pass through because the navigation in and out is automatic” method.
