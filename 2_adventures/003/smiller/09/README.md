# Day 9

## Back to cucumber formatters

What with the fix to cucumber head, if you change your Gemfile to refer to

```
gem 'cucumber', github: 'cucumber/cucumber'
```

and modify your `features/support/linked_html.rb` to also include:

```ruby
# as in 2.0.0, except that:
# @builder.text!(comment_line) becomes:
# @builder << insert_links(comment_line)
# ... calls insert_links,
# and uses << instead of text! to avoid escaping html
def comment_line(comment_line)
  @builder << insert_links(comment_line)
  @builder.br
end
```

and run a cucumber feature using that extended html formatter, it might blow up with

```
  Scenario: Shipment with incomplete address                  # features/rtv/shipping_address_validations.feature:23
  undefined method `with_filtered_backtrace' for #<Cucumber::Core::Test::Result::Passed:0x00000115dc3d48> (NoMethodError)

undefined method `with_filtered_backtrace' for #<Cucumber::Core::Test::Result::Failed:0x00000115dcb048> (NoMethodError)
/Users/seanmiller/.rvm/gems/ruby-2.0.0-p451/bundler/gems/cucumber-19801f29ceed/lib/cucumber/formatter/legacy_api/adapter.rb:39:in
`after_test_case'
```

To start narrowing the scope of the problem, running a cucumber feature with the
default (pretty) formatter also blows up the same way.

So: we know that `cucumber/formatter/legacy_api/adapter.rb:39` is the immediate
culprit: looking at that in github we can see that it was changed to add
`with_filtered_backtrace` as part of the commit that fixed the problem.  Just to
verify, we can `bundle open cucumber` locally, revert those two lines to the
pre-change versions, and re-run the scenario, and it passes without blowing up.

But wait, there's more.  Since this feels like something that is using stuff
that is moving from `cucumber` to `cucumber-core`, let's also run `bundle open
cucumber-core` to look for it there.  Running that shows us that it opens
`cucumber-core-1.1.3` instead of the HEAD version, like `cucumber-19801f29ceed`.

Putting

```ruby
gem 'cucumber-core', github: 'cucumber/cucumber-ruby-core', require: false
```

in the Gemfile above `gem 'cucumber'`, and getting rid of local changes (running
`gem pristine cucumber` didn’t seem to work when getting the gem from github,
but `bundle update cucumber` did), made it work.

So the fix did exactly as expected, and I exposed a gap in my understanding that
setting a gem to fetch the latest from github does not make any difference to
how it callls dependencies.  Something to be careful of in using multi-gem
projects going forward.  In the meantime, though, both linked_html variants are
now available, so that’s good.
