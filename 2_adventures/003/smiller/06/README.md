# Day 6

## Github-Flavoured Markdown

First off, over the first five days I had been irritated that though Emacs
markdown-mode had a preview function (`C-c C-c p`), it did not output as
github-flavoured markdown, so it wasn’t an exact match.  An investigation
brought to light:

http://increasinglyfunctional.com/2014/12/18/github-flavored-markdown-previews-emacs/

which when I added the file from the [gist](https://gist.github.com/joshuamiller/6d58f8bd239df56cabe8) as `~/.emacs.d/flavor.rb` and added

```
(setq markdown-command "~/.emacs.d/flavor.rb")
```

to my `.emacs` got round that problem.  So kudos to [Joshua Miller](https://github.com/joshuamiller) for that.

Commit [here](https://github.com/smiller/.new.emacs.d/commit/c6f63a9091112d99f707c23f3578385eca59ba63).

## Investigating the Cucumber Regression

Back to the regression in displaying comments below the feature-level in
cucumber 2.0.  After yesterday not getting there looking at the code, I created
a new Rails app, added the cucumber gem, added the simplest feature file that
would work:

```
# Feature-level comment
Feature: a feature
  # Scenario-level comment
  Scenario: a scenario
    Given a step
```

ran it and added the step definition with pending.

The ran `bundle show cucumber` to see which cucumber I was on (1.3.19), so then I did
`bundle open cucumber` to open up the gem in my editor, went to the html formatter file,
added `require 'byebug'` at the top, then put `debugger` in the `comment_line`
method, then ran `cucumber` from the Rails app and followed up the context of
where it was being called from.

Having done that, I went back to the Gemfile, specified the version of the
cucumber gem,

```
gem 'cucumber', '2.0.0'
```

re-ran `bundle install` to get that version of the gem, ran `bundle open
cucumber`, added the debugger again, went back to the Rails app again and ran
`cucumber` and followed the context of where it was being called from in the
different gem.

(Once you’ve finished this sort of investigation it is of course vital to run

```
gem pristine cucumber
```

to remove any additional logging or debugging code you may have introduced into
the gem.)

Having done that, I looked again at `formatter/legacy_api/adapter.rb` and
wondered if the problem wasn’t here:

```ruby
def feature(node, *)
  if node != @current_feature
    @child.after if @child
    @child = FeaturePrinter.new(formatter, results, support_code, config, node).before
    @current_feature = node
  end
end

def scenario(node, *)
end

def scenario_outline(node, *)
end

…
```

I found that there was also a `@current_scenario` variable and a
`ScenarioPrinter`, so I added a body to the `scenario` method that did the same
thing, and ran the tests and they blew up comprehensively, which is a perfectly
valid result for cargo-culting.

## They’d Already Solved It

I then went back to the my cucumber PR, and discovered it was closed because
someone had already implemented a [fix](https://github.com/cucumber/cucumber/commit/95bcefacbc5f9b6ac0800ad738f5f4e8b1088813).

Not by filling in the empty `def scenario`, `def scenario_outline` above, but by
adding

```ruby
Ast::Comments.new(node.comments).accept(formatter)
```

to the rest of the `Printers` (including `ScenarioPrinter`) and not just the
`FeaturePrinter`.

Looking at the `formatter/legacy_api/adapter_spec`, I see that they also get the
test closer to the actual code, but whereas I was trying to figure out how to
put something like `:before_comments` / `:after_comments` in the `expect(
formatter.legacy_messages )` block, they have put in extra `:before_tags` and
`:after_tags`.  Which may only be testing that the formatters output tags below
the feature-level, because then they’ve got a separate test of one of the simple
formatters that both tags and comments are output at various lower levels.

Still don’t understand this code as well as I’d like, and will need to
investigate further, but very grateful to the Cucumber team for the rapidity of
their response.

And that’s Day 6.
