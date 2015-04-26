require_relative '../lib/string_calc'

describe StringCalc do
  describe "add" do

    it "returns 0 for empty string" do
      result = StringCalc.new.add("")

      expect(result).to eq 0
    end

    it "does not return 0 if string is not empty" do
      result = StringCalc.new.add("abc")

      expect(result).not_to eq 0

    end
  end
end
