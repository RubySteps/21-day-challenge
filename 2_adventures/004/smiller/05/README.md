# 004/05

Bit of a flash-back to 003, as I troubleshoot some slowness in cucumber / page
object scenarios.

In fact, after debugging, I think I now understand why the SitePrism default is
to bypass Capybara’s implicit wait.

If you’ve got an `elements :rows` on a page but you’ve got a javascript
front-end so that the page loads and then the data loads, and before the data
appears there’s a still-loading UI element, then you want to only check for
(say) the count of rows after the UI element is no longer visible.  Which exists
in SitePrism, `wait_until_<element>_invisible`, true, but if the element might
or might not be there at the start you might need to check `<element>.visible?`,
and with implicit waits that takes as long as the Capybara default time out to
verify.

There must be a sensible and non-blocking solution to this problem.  I haven’t
found it yet, which is irritating.
