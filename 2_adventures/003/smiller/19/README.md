# Day 19

Travel and fixing failing tests on someone else’s branch at the day job mean that today all I’ve got is the README.

Initial investigation of the five-state problem reveals that because of the javascript front-end, the URL for four of the five states is the same.  So “complete success” can be distinguished from the other four simply by `on_page(:next_page)`.  The other four will still be `on_page(:check_page)`, as follows:

1. external service offline
2. external service rejects user input
3. external service says user input is ambiguous, offers corrections (but rejects initial input)
4. external service allows user input, but also offers alternate suggestions


\#1 and #2 can be uniquely identified by the content of their error messages, and will display the original form.

\#3 and #4 will display a new form with suggestions, either allowing (#4) or not allowing (#3) the initial input.

So this could be verified by:

```ruby
# #1:
on_page(:check_page) do |page|
  expect(page).not_to have_css('#suggestion-form')
  expect(page).to have_error_message(t('.offline'))
end

# #2:
on_page(:check_page) do |page|
  expect(page).not_to have_css('#suggestion-form')
  expect(page).to have_error_message(t('.rejected'))
end

# #3:
on_page(:check_page) do |page|
  expect(page).to have_css('#suggestion-form')
  expect(page).not_to have_css('#allow-original')
end

# #4:
on_page(:check_page) do |page|
  expect(page).to have_css('#suggestion-form')
  expect(page).to have_css('#allow-original')
end
```

This doesn’t feel like it is fitting neatly into the page object after all, though the four states could be in methods on the page object with an RSpec custom matcher that calls the individual method and returns a more informative error message.

It feels like the concept of page flows is missing, though.  I think there was something for that in one of the cheezy/page-object libraries, though – investigate https://github.com/cheezy/page_navigation next.
