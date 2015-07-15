require 'emerald'
require 'spec_helper'

describe Emerald::CLI do
  describe "#emerald" do
    context "plan from a file eg1" do
      let(:emerald) { Emerald::CLI.start(["emerald", "--file", 'data/eg1.txt']) }

      context "containing valid test data" do
        it "should parse the file contents and output a result" do
          expect($stdin).not_to receive(:gets)
          results = capture(:stdout) { emerald }
          expect(results).to match(/3200,7,7,0/)
        end
      end
    end
  end
end
