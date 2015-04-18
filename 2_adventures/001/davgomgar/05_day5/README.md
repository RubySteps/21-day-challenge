Day 5 README file
===

Using metaprogramming create some attr_accesor which tracks all the values set to some attribute except current value which is stored in the attribute itself

For example
```ruby
my_class = MyClass.new
my_class.attr1 = "some value"
my_class.attr1 = 3
my_class.attr1 = 1.0

my_class.attr1_history # should return [nil, "some value", 3]
```
