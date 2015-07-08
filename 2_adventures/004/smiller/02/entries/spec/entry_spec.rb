require_relative "../lib/entry"
require_relative "../lib/line"

RSpec.describe Entry, "#paragraphs" do
  context "empty" do
    it "returns []" do
      entry = Entry.new([])
      expect(entry.paragraphs).to eq([])
    end
  end
  context "one line" do
    it "returns [[one_line]]" do
      one_line = Line.new("one_line")
      entry = Entry.new([one_line])
      expect(entry.paragraphs).to eq([[one_line]])
    end
  end
  context "three paras" do
    it "returns three paras" do
      first = [Line.new("first")]
      middle = [Line.new("middle 1"), Line.new("middle 2")]
      last = [Line.new("last")]
      blank = Line.new("")
      entry = Entry.new([first, blank, middle, blank, last].flatten)
      expect(entry.paragraphs).to eq([first, middle, last])
    end
  end
end
