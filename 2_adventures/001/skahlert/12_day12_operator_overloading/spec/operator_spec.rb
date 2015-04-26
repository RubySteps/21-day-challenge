require 'operator'

describe MyOperator do
  let(:operator_one){described_class.new("Hello")}
  let(:operator_two){described_class.new("World")}
  it "can add to itself" do
    expect(operator_one+operator_two).to eq("Hello World")
  end

  it "can multiply with fixnum" do
    expect(operator_one*3).to eq("Hello Hello Hello")
  end

  it "can multiply both ways" do
    expect(3*operator_two).to eq("World World World")
  end

  it "should raise TypeError for non-fixnum numerics" do
    expect{ operator_one*3.1 }.to raise_error(TypeError)
  end
  it "should raise TypeError for non-Fixnum in inverted order" do
    expect{ 3.1*operator_two }.to raise_error(TypeError)
  end
end
