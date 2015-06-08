# Day 7

## Considering a UI test problem

Suppose you’ve got a point in your app where some user input is sent off for
external third-party validation, as a result of which there are five possible
response states:

1. external service offline
2. external service rejects user input
3. external service says user input is ambiguous, offers corrections (but rejects
initial input)
4. external service allows user input, but also offers alternate suggestions
5. external service allows user input, and moves on to next step.

Obviously at the unit level you can just put in a test that sending various
inputs return the expected outputs, and that’s a simple test.  But if you wanted
to test this in the UI, possibly mocking out the third party service in all but
one case, you’re testing that the resulting screen contains the features and
elements and messages of state #1, say, but not any of the others.

Pondering whether this is an easy extension to the page object idea.

## Page objects

On a previous codebase I have used https://github.com/cheezy/page-object

Someone else has spoken well of https://github.com/natritmeyer/site_prism

I haven’t used either one for this particular use case.  It would be interesting
to experiment.

Not all of the states are separate pages, though arguably #1 and #2 (rejection)
are different from #3 and #4 (offer alternatives) and from #5 (straight to next
step).  So the trick would be grouping subsets of functionality and messages and
seeing if at the feature-file level you can just have something like

```ruby
Then I should see the input rejected page
```

And have that underneath do all of (it should have the features of #1 without
the features of #2-#5), bearing in mind that it isn’t precisely a separate
page.  Bonus points if the error messaging is expressive.

This calls for further experiment.  And possibly two spikes.
