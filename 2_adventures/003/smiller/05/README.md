Given that I now have a failing spec in cucumber, how would I go about fixing
the code?

For starters, it’s not a html-formatter-specific problem: the pretty
formatter does the same.  Which makes sense.  Something triggers the formatter’s
`comment_line` method (and `before_comment` and `after_comment` when they
exist), and that’s what is identifying the comment and as of 2.0 only
identifying a comment at the top of the file.

And we’re calling `formatter.comment_line` from https://github.com/cucumber/cucumber/blob/master/lib/cucumber/formatter/legacy_api/ast.rb#L61

```ruby
        Comments = Struct.new(:comments) do
          def accept(formatter)
            return if comments.empty?
            formatter.before_comment comments
            comments.each do |comment|
              formatter.comment_line comment.to_s.strip
            end
          end
        end
```

and we’re referencing that at
https://github.com/cucumber/cucumber/blob/master/lib/cucumber/formatter/legacy_api/adapter.rb#L210

```ruby
        FeaturePrinter = Struct.new(:formatter, :results, :support_code, :config, :node) do

          def before
            formatter.before_feature(node)
            Ast::Comments.new(node.comments).accept(formatter)
            Ast::Tags.new(node.tags).accept(formatter)
            formatter.feature_name node.keyword, indented(node.legacy_conflated_name_and_description)
            @delayed_messages = []
            @delayed_embeddings = []
            self
          end

```

So if I can work out how to put a spec closer to the source of the problem, it
would be useful.  I also see that of the four files in `legacy_api`, only one of
them has a matching spec.

I also wonder if this is all code which is expected to be replaced by code in
`cucumber-core` at some point anyway, in which case this would be a short-lived fix.

Pondering…

Right.  Memo to self: having learned all about Abstract Syntax Trees would have
been a useful prerequisite to this step.  Come up with a plan of attack for that
and come back to this better prepared tomorrow?  I think that has to be the
plan.  (Though also comment on the open cucumber failing-spec PR with what I’ve
discovered so far, that this isn’t a formatter-related problem.)
