require 'spec_helper'

module Codebreaker
  describe Game do
    describe "#start" do

      it "sends a welcome message" do
        out = double('out').as_null_object
        game = Game.new(out)

        expect(out).to receive(:puts).with("Welcome to Codebreaker!")

        game.start
      end

      it "prompts for the first guess" do
        out = double('out').as_null_object
        game = Game.new(out)

        expect(out).to receive(:puts).with("Enter guess:")

        game.start
      end
    end
  end
end