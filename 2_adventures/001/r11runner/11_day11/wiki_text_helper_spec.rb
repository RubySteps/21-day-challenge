require 'rails_helper'

describe "WikiTextHelper" do

  describe "replace_custom_markup" do

    before(:each) do
      extend WikiTextHelper
    end

    it "returns nil for nil" do
      result = self.replace_custom_markup nil
      expect(result).to eq(nil)
    end

    it "returns a text without links as a paragraph" do
      input_text = "just text"
      expected_result= "<p>just text</p>"
      result = self.replace_custom_markup input_text
      expect(result).to eq(expected_result)
    end

    it "returns link for game" do
      game = Game.create! id: 3, white: "Aronian", black: "Anand"
      input_text = "bla #game3#link# sth more"
      expected_result = '<p>bla <a href="/games/3">Aronian vs Anand</a> sth more</p>'
      result = self.replace_custom_markup input_text
      expect(result).to eq(expected_result)
    end

    it "returns link for game with 2-digit id" do
      game = Game.create! id: 28, white: "Aronian", black: "Anand"
      input_text = "bla #game28#link# sth more"
      expected_result = '<p>bla <a href="/games/28">Aronian vs Anand</a> sth more</p>'
      result = self.replace_custom_markup input_text
      expect(result).to eq(expected_result)
    end

    it "returns link for 2 games" do
      game5 = Game.create! id: 5, white: "Aronian", black: "Anand"
      game42 = Game.create! id: 42, white: "Carlsen", black: "Caruana"
      input_text = "2 good examples: #game42#link#, #game5#link# whatever"
      expected_result = '<p>2 good examples: <a href="/games/42">Carlsen vs Caruana</a>, <a href="/games/5">Aronian vs Anand</a> whatever</p>'
      result = self.replace_custom_markup input_text
      expect(result).to eq(expected_result)
    end

    it "inserts a board for board-markup-tag" do
      extend GamesHelper
      game5 = Game.create! id: 5, white: "Aronian", black: "Anand", moves: "1.e4 c5"
      input_text = "Let's watch an example with active rooks #game5#board# ni"
      result = self.replace_custom_markup input_text
      expect(result).to include("iframe")
    end

    it "inserts a message at unknown markup tag" do
      game5 = Game.create! id: 5, white: "Aronian", black: "Anand", moves: "1.e4 c5"
      input_text = "whatever #game5#dummy#"
      result = self.replace_custom_markup input_text
      expect(result).to include "unknown markup element #dummy# for game 5"
    end

    it "removes script-tag from text" do
      input_text = "just text<script>anything</script>"
      expected_result= "<p>just text</p>"
      result = self.replace_custom_markup input_text
      expect(result).to eq(expected_result)
    end


    it "removes script-tag from text before board" do
      extend GamesHelper
      input_text = "Funny game:<script>anything</script>#game33#board#"
      Game.create! id: 33, white: "Aronian", black: "Anand", moves: "1.e4 c5"
      expected_result= "<p>just text</p>"
      result = self.replace_custom_markup input_text
      expect(result).to include("iframe")
      expect(result).to_not include("script")
    end


    it "removes script-tag from text after board" do
      extend GamesHelper
      input_text = "Funny game:#game33#board#<script>anything</script>"
      Game.create! id: 33, white: "Aronian", black: "Anand", moves: "1.e4 c5"
      expected_result= "<p>just text</p>"
      result = self.replace_custom_markup input_text
      expect(result).to include("iframe")
      expect(result).to_not include("script")
    end

  end
  
end
