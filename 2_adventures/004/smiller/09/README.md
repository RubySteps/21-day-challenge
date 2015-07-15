# 004-09

Put together a simple-as-possible Rails app ([entries-rails](https://github.com/smiller/entries-rails)) so that I had a frame for a page which intermittently polled a textarea and updated the html output accordingly.

Talking of the simplest thing that could possibly work:

```javascript
function buildPreview(){
  $.post("/preview", { textin: $("#textin").val() },  function(data) {
    $("#textout").empty();
    $("#textout").append($.parseHTML(data.textout))
    setTimeout(buildPreview,10000);
  });
}

buildPreview();
```

One thing that experimenting with different kinds of entries in the result revealed is that multiple blank lines break the formatter:

```ruby
NoMethodError (undefined method `indent' for nil:NilClass):
  lib/html_formatter.rb:13:in `format_paragraph'
  lib/html_formatter.rb:7:in `block in format'
  lib/html_formatter.rb:7:in `collect'
  lib/html_formatter.rb:7:in `format'
  app/controllers/entries_controller.rb:11:in `preview'
```

So let’s go back to the [entries](https://github.com/smiller/entries) project and add a failing test for that / decide how to fix that.  Even if we do make it a rule that the EntryBuilder won’t create multiple blank lines – which we probably will – the HtmlFormatter shouldn’t fall over if one slips through.  So we add a spec:

```ruby
# spec/html_formatter_spec.rb
context "doesn't choke on multiple blank lines" do
  it "copes" do
    f = HtmlFormatter.new(Entry.new([Line.new("mind the gap..."),
                                     Line.new(""),
                                     Line.new(""),
                                     Line.new("... safely stowed")]))
    expect(f.format).to eq("<p>mind the gap...</p><p>... safely stowed</p>")
  end
end
```

and watch it fail:

```ruby
Failures:

  1) HtmlFormatter#format doesn't choke on multiple blank lines copes
     Failure/Error: expect(f.format).to eq("<p>mind the gap...</p><p>... safely stowed</p>")
     NoMethodError:
       undefined method `indent' for nil:NilClass
     # ./lib/html_formatter.rb:13:in `format_paragraph'
     # ./lib/html_formatter.rb:7:in `block in format'
     # ./lib/html_formatter.rb:7:in `collect'
     # ./lib/html_formatter.rb:7:in `format'
     # ./spec/html_formatter_spec.rb:68:in `block (3 levels) in <top (required)>'
```

And then go look at the code, and realize that if `Entry#paragraphs` didn’t return multiple blank lines it wouldn’t, and we’ve six minutes to go so rather than writing an inner test for `Entry#paragraphs`, which would be the better if less rushed approach, we just write code in `#paragraphs` that makes the outer test pass:

```ruby
def paragraphs
  return [] if @lines.count == 0
  @lines.inject([[]]) do |result, line|
    build_next_result(result, line)
  end
end

private

def build_next_result(result, line)
  unless second_blank_line(result, line)
    line.text == "" ? result << [] : result.last << line
  end
  result
end

def second_blank_line(result, line)
  line.text == "" && result.last == []
end
```

And now we have passing tests and a refactoring cycle to do.  (Maybe the guard code should go on the initializer?  On the other hand, if there is bad data in the database, we still want to catch it before `#paragraphs` passes it up to the HtmlFormatter, so we probably want it here too, at the least.
