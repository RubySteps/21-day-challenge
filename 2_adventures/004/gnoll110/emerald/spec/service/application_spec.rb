require 'emerald'
require 'spec_helper'

describe Emerald::Application do
  it "set bodyweight" do
    app = Emerald::Application.new
    app.process("WEIGHT 110")
    result = expect { app.process("REPORT") }.to output("110\n").to_stdout
    expect(result).to eq(true)
  end
end