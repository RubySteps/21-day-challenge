require 'spec_helper'

describe Ladida do
  it 'has a version number' do
    expect(Ladida::VERSION).not_to be nil
  end

  it 'outputs in the right language' do
    g = Ladida::Greeter.new
    expect{ g.hello_world }.to output("Hello world!\n").to_stdout
    expect{ g.hello_world('jp') }.to output("Konnichiwa sekai!\n").to_stdout
  end
end
