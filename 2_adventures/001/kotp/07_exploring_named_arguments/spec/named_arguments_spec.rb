require_relative 'spec_helper'
require 'named_arguments'

describe 'Named Arguments' do
  it " default values will be presented" do
    my_object = NamedArguments.new
    my_object.user.must_equal 'user not provided'
    my_object.host.must_equal 'host not provided'
  end
  it' No need to merge' do
    my_object = NamedArguments.new(user: 'Georgette')
    my_object.user.must_equal 'Georgette'
    my_object.host.must_equal 'host not provided'
  end
  it ' given positional arguments still works as expected' do
    my_object = NamedArguments.new('Georgette', 'example.com')
    my_object.user.must_equal 'Georgette'
    my_object.host.must_equal 'example.com'
  end
end
