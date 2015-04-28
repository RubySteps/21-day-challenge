require_relative '../lib/string_calc'

describe StringCalc do
  describe "add" do

    it "returns 0 for empty string" do
      result = StringCalc.new.add("")

      expect(result).to eq 0
    end

    it "does not return 0 if string is not empty" do
      pending
      result = StringCalc.new.add("abc")

      expect(result).not_to eq 0

    end

    it "returns number if single number" do
      result = StringCalc.new.add("1")

      expect(result).to eq 1
    end

    it "returns number if single number even if 0" do
      result = StringCalc.new.add("0")

      expect(result).to eq 0
    end
  end
end
