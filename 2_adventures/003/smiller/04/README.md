From the cucumber/cucumber slack:

	smiller June 3 2015
	Somewhere between 1.3.19 and 2.0.0, did we lose the Cucumber::Formatter::Html outputting comments to the output? I see that the before\_comment / comment\_line / after\_comment methods are still there in the code, but if I reset the gem version to 1.3.19 the comments show up in the output, and if I change it back to 2.0.0 they vanish.

	smiller June 3 2015
	More specifically, between 1.3.19 and 2.0.0.rc.1 (the 2.0.0.betas didn’t run it at all, between undefined method `initializer’ for Cucumber:Module (NoMethodError) and cannot load such file — cucumber/core/ast/multiline_argument)

	mattwynne an hour ago
	Good catch @smiller!
	We’ve had a handfull of regressions like this where there weren’t any tests
	The ideal thing would be if you could write a failing spec for the HTML formatter that needs this behaviour to pass. Then we can work on a fix.

	smiller 16 minutes ago
	@mattwynne Excellent. Will try to put that together on the weekend. Thanks!

	smiller 4 minutes ago
	Actually puzzled that https://github.com/cucumber/cucumber/blob/master/spec/cucumber/formatter/html_spec.rb#L80 doesn’t catch this, now I look at the existing specs.

git cloned https://github.com/cucumber/cucumber
bundle installed
ran rspec spec/cucumber/formatter/html_spec.rb: it passed.  Oddly.

```ruby
describe "with a comment" do
  define_feature <<-FEATURE
    # Healthy
    Feature: Foo
      Scenario:
        Given passing
  FEATURE

  it { expect(@out.string).to match(/^\<!DOCTYPE/) }
  it { expect(@out.string).to match(/\<\/html\>$/) }
  it { expect(@doc).to have\_css\_node('.feature .comment', /Healthy/) }
end
```

but my failure case earlier was adding comments at scenario level, not at
feature level.  So added:

```ruby
describe "with a comment at scenario level" do
  define_feature <<-FEATURE
    Feature: Foo
      # Healthy Scenario
      Scenario:
        Given passing
  FEATURE

  it { expect(@doc).to have\_css\_node('.scenario .comment', /Healthy Scenario/) }
end
```

and it failed.

So am now making a PR to cucumber with the failing spec, and that’s my day 4.
(If I end up figuring out the fix for day 5, so much the better.)
