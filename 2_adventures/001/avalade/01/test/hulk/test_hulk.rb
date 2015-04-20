require 'minitest/autorun'
require 'hulk'

describe Hulk do
  it "must exist" do
    refute_nil Hulk.new
  end
end
