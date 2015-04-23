require 'spec_helper'

module Codebreaker
  describe Game do
    describe "#start" do

      it "sends a welcome message" do
        out = double('out')
        game = Game.new(out)

        expect(out).to receive(:puts){ "Welcome to Codebreaker!" }

        game.start
      end

      it "prompts for the first guess"
    end
  end
end