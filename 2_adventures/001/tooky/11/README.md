The main thrust of today was to make Suite a composite of TestCases. They should
have the same interface, so run_all doesn't care if its given a TestCase, or
a Suite, or any number of either.

I also pushed result to become a collecting paramter that should always be
injected. I'm thinking we will want to inject a different object to handle
reporting a little better - it may well decorate our exisiting result object.
