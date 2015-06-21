# Day 18

## Page objects and input validation

Suppose you’ve got a form with a field and the expected input is a positive integer.  And you want to test that, say, 0, -1, and “abcde” result in the appropriate error message showing up and the save/submit/whatever button being disabled.

This might look like a case where assertions on the page object do make sense:

```ruby
on_page(:input_page) do |page|
  page.submit_value "abcde"
  page.input_disallowed_with_message?("Please don't put letters in here")
end

module PageObjects
  class InputPage < SitePrism::Page

    element :error_message, ".alert-message"
    element :input_field, "input#field"
    element :save_button, "input[type='commit']"

    def submit_value(value)
      input_field.set value
	  save_button.click
	end

    def input_disallowed_with_message?(message_text)
      expect(error_message).to have_text(message_text)
	  expect(save_button).to be_disabled
    end
```

because you’re saying “If the page is in an error state, it should look like this”, and it feels like this does vary with the page, unlike “some subset of authorized links should be displayed on the navigation menu”, which varies depending on the user’s authorizations.

This actually goes back to my Day 7 question about whether page objects could usefully handle the five different response states when user input is sent off for external validation and there are five possible response states.  And I think in that case, the page object combination of properties is a useful abstraction and I’ll try to get back to answer that (finally) on Day 19.

For the simpler “invalid input results in an error message and a disabled save button”, though, I would still use the custom RSpec matcher, partly because you can provide a more informative error message, and partly because I would argue that that behaviour is framework-level, not page-level.  If you’ve got a consistent UI and consistent handling of invalid data, that behaviour should be expressed only once in the custom matcher, which can also take the message text as an argument.  For common error messages, I would also create argument-free matchers that would delegate to the message-text-argument-taking matcher.

```ruby
on_page(:input_page) do |page|
  page.submit_value "abcde"
  expect(page).to show_invalid_input_state_with("Please don't put letters in here")
  # or
  expect(page).to show_invalid_input_state_with_please_no_letters_message
end
```

Thinking ahead, I would probably also end up using an RSpec custom matcher to provide a more informative error message in the five possible response states case, but in that case, because the responses are much more page-specific rather than universal, I would have the RSpec custom matcher call in to methods on the page object to check a handful of fields and values and from that provide a consolidated “expected to be in state one, was in state three”, or, if it somehow doesn’t match any of the expected states, “expected to be in state one, was in…” and then some breakdown of what’s visible and what isn’t or a link to a screenshot.  We’ll see tomorrow.
