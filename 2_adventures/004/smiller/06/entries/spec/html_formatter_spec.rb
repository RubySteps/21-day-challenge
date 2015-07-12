require_relative "../lib/html_formatter"
require_relative "../lib/entry"
require_relative "../lib/line"

RSpec.describe HtmlFormatter, "#format" do
  context "empty" do
    it "returns ''" do
      f = HtmlFormatter.new(Entry.new([]))
      expect(f.format).to eq("")
    end
  end

  context "one line" do
    context "no indent" do
      it "returns '<p>one line</p>'" do
        f = HtmlFormatter.new(Entry.new([Line.new("one line")]))
        expect(f.format).to eq("<p>one line</p>")
      end
    end
    context "indent 1" do
      it "returns '<blockquote>one line</blockquote>'" do
        f = HtmlFormatter.new(Entry.new([Line.new(1, "one line")]))
        expect(f.format).to eq("<blockquote>one line</blockquote>")
      end
    end
    context "indent 2" do
      it "returns '<blockquote><blockquote>one line</blockquote></blockqute>'" do
        f = HtmlFormatter.new(Entry.new([Line.new(2, "one line")]))
        expect(f.format).to eq("<blockquote><blockquote>one line</blockquote></blockquote>")
      end
    end
  end

  context "paragraphs but no indent" do
    it "copes" do
      f = HtmlFormatter.new(Entry.new([Line.new("start"),
                                       Line.new(""),
                                       Line.new("v1 l1"),
                                       Line.new("v1 l2"),
                                       Line.new(""),
                                       Line.new("v2 l1"),
                                       Line.new("v2 l2")]))
      expect(f.format).to eq("<p>start</p>" +
                             "<p>v1 l1<br/>v1 l2</p>" +
                             "<p>v2 l1<br/>v2 l2</p>")
    end
  end

  context "paragraphs and indent" do
    it "copes" do
      f = HtmlFormatter.new(Entry.new([Line.new("That line from that play"),
                                     Line.new(""),
                                     Line.new(1, "CAESAR"),
                                     Line.new(""),
                                     Line.new(2, "until the gods are tired of blood and create a race that can understand.")]))

      expect(f.format).to eq("<p>That line from that play</p>" +
                             "<blockquote>CAESAR</blockquote>" +
                             "<blockquote><blockquote>until the gods are tired of blood and create a race that can understand.</blockquote></blockquote>")
    end
  end
end
