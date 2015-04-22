# Start to flesh out the API

Have added a new api for creating a test suite:

```ruby
TinyTest.specify "thing we are building" do
  must "have a particular property" do
    assert_equal true, true
  end
end
```

The names aren't used by the code currently, but I intend to make use of them in
reporting as we progress.

I've started making use of this approach for the assert tests. Still more
refactoring to do for this.

