require 'minitest/autorun'
require './foo.rb'

describe Foo do
  it "can be created with no parameters" do
    Foo.new.must_be_instance_of Foo
  end

  it "responds to foo accesor" do
    Foo.new.respond_to? :foo
  end

  it "responds to bar accessor" do
    Foo.new.respond_to? :bar
  end

  it "can store some value in foo" do
    my_foo = Foo.new
    my_foo.foo = 42

    my_foo.foo.must_equal 42
  end

  it "can store some value in bar" do
    my_foo = Foo.new
    my_foo.bar = "this is bar"

    my_foo.bar.must_equal "this is bar"
  end

  it "can save foo history" do
    foo = Foo.new
    foo.foo = 2
    foo.foo = "This is a test"
    foo.foo = "Rubysteps rules"

    foo.foo_history.must_equal [nil, 2, "This is a test"]
    foo.foo.must_equal "Rubysteps rules"
  end
end
