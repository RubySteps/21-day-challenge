require 'emerald'
require 'spec_helper'

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
      let(:emerald) { Emerald::CLI.start(["emerald"]) }

      context "with valid commands" do
        it "should process the commands and output the results" do
          allow($stdin).to receive(:gets).and_return('WEIGHT 110', 'REPORT', 'EXIT')
          results = capture(:stdout) { :emerald }
          expect(results).to match(/110/)
        end
      end
    end

    context "executing instructions from the command line (2)" do
      let(:output) { capture(:stdout) { Emerald::CLI.start(["emerald"]) } }

      context "with valid commands" do
        it "should process the commands and output the results" do
          allow($stdin).to receive(:gets).and_return('WEIGHT 110', 'REPORT', 'EXIT')
          expect(output).to include '110'
        end
      end
    end


  end
end