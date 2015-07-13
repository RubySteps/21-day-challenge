# -*- coding: utf-8 -*-
require_relative "../lib/entry_builder"
require_relative "../lib/entry"
require_relative "../lib/line"

RSpec.describe EntryBuilder, "#build" do
  context "no indent" do
    it "returns unindented" do
      raw = ["E quella a me: “Nessun maggior dolore",
             "che ricordarsi del tempo felice",
             "ne la miseria; e ciò sa ’l tuo dottore.",
             "",
             "Ma s’a conoscer la prima radice"]
      expected = Entry.new([Line.new("E quella a me: “Nessun maggior dolore"),
      Line.new("che ricordarsi del tempo felice"),
      Line.new("ne la miseria; e ciò sa ’l tuo dottore."),
      Line.new(""),
      Line.new("Ma s’a conoscer la prima radice")])
        b = EntryBuilder.new(raw)
      lines_match(expected, b.build)
    end
  end
  context "single indent level, but not multiple lines" do
    it "returns Dante entry" do
      raw = ["> E quella a me: “Nessun maggior dolore",
             "",
             "> Ma s’a conoscer la prima radice"]
      expected = Entry.new([Line.new(1, "E quella a me: “Nessun maggior dolore"),
      Line.new(""),
      Line.new(1, "Ma s’a conoscer la prima radice")])
      b = EntryBuilder.new(raw)
      lines_match(expected, b.build)
    end
  end
  context "single indent level" do
    it "returns Dante entry" do
      raw = ["> E quella a me: “Nessun maggior dolore",
             "che ricordarsi del tempo felice",
             "ne la miseria; e ciò sa ’l tuo dottore.",
             "",
             "> Ma s’a conoscer la prima radice"]
      expected = Entry.new([Line.new(1, "E quella a me: “Nessun maggior dolore"),
      Line.new(1, "che ricordarsi del tempo felice"),
      Line.new(1, "ne la miseria; e ciò sa ’l tuo dottore."),
      Line.new(""),
      Line.new(1, "Ma s’a conoscer la prima radice")])
        b = EntryBuilder.new(raw)
      lines_match(expected, b.build)
    end
  end
end

def lines_match(expected, actual)
  expect(actual.lines.count).to eq(expected.lines.count)
  actual.lines.zip(expected.lines).each do |actual_line, expected_line|
    expect(actual_line.indent).to eq(expected_line.indent)
    expect(actual_line.text).to eq(expected_line.text)
  end
end
