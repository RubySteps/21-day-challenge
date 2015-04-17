class Foo
  require './accessor_history'
  attr_accessor_with_history :foo
  attr_accessor_with_history :bar
end


foo = Foo.new
foo.foo = "one"
foo.foo = "two"
foo.foo = "three"

p foo.foo
p foo.foo_history
