# What I did

I created a simple script that will copy itself to the next warmup directory, so
I didn't have to do too much work.

The main ruby trick it uses is `String#succ` which will increment the final
character in a string by 1, according to [various
rules](http://ruby-doc.org/core-2.2.1/String.html#method-i-succ).

```ruby
a_path   = "some/dir/structure/01"
new_path = a_path.succ

new_path # => "some/dir/structure/01"
```
