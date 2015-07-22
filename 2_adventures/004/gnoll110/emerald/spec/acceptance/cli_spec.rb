require 'emerald'
require 'spec_helper'
require 'byebug'

describe Emerald::CLI do
  describe "#emerald" do
    #context "plan from a file eg1" do
    #  let(:emerald) { Emerald::CLI.start(["emerald", "--file", 'data/eg1.txt']) }

    #  context "containing valid test data" do
    #    it "should parse the file contents and output a result" do
    #      expect($stdin).not_to receive(:gets)
    #      results = capture(:stdout) { emerald }
    #      expect(results).to match(/3200,7,7,0/)
    #    end
    #  end
    #end

    context "executing instructions from the command line" do
      puts "A"
      byebug
      let(:emerald) { Emerald::CLI.start(["emerald"]) }

      context "with valid commands" do
        it "should process the commands and output the results" do
          puts "a"
          expect($stdin).to receive(:gets).and_return('WEIGHT 110', 'REPORT', 'EXIT')
          puts "b"
          results = capture(:stdout) { emerald }
          puts "c"
          expect(results).to match(/110/)
          puts "d"
        end
      end
    end
  end
end