require 'spec_helper'

module Codebreaker
  describe Game do
    describe "#start" do
      before(:each) do
        @out = double('out').as_null_object
        @game = Game.new(@out)
      end

      it "sends a welcome message" do
        expect(@out).to receive(:puts).with("Welcome to Codebreaker!")
        @game.start
      end

      it "prompts for the first guess" do
        expect(@out).to receive(:puts).with("Enter guess:")
        @game.start
      end
    end
  end
end