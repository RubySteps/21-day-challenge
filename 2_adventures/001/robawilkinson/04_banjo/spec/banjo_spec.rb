require_relative "../lib/banjo"

describe Banjo do
  describe ".chord" do
    it "takes a major Chord letter and returns the notes" do
      expect(Banjo.notes('a')).to eq(['a','c#','e'])
    end
    it "takes a major Chord letter and returns the notes" do
      expect(Banjo.notes('b')).to eq(['b','d#','f#'])
    end
    it "takes a major Chord letter and returns the notes" do
      expect(Banjo.notes('c')).to eq(['c','e','g'])
    end
    it "takes a major Chord letter and returns the notes" do
      expect(Banjo.notes('d')).to eq(['d','f#','a'])
    end
    it "takes a major Chord letter and returns the notes" do
      expect(Banjo.notes('e')).to eq(['e','g#','b'])
    end
    it "takes a major Chord letter and returns the notes" do
      expect(Banjo.notes('f')).to eq(['f','a','c'])
    end
    it "takes a major Chord letter and returns the notes" do
     expect(Banjo.notes('g')).to eq(['g','b','d'])
    end
    it "takes a minor Chord letter and returns the notes" do
      expect(Banjo.notes('cm')).to eq(['c','d#','g'])
    end
    it "takes a minor Chord letter and returns the notes" do
      expect(Banjo.notes('dm')).to eq(['d','f','a'])
    end
    it "takes a minor Chord letter and returns the notes" do
      expect(Banjo.notes('em')).to eq(['e','g','b'])
    end
    it "takes a minor Chord letter and returns the notes" do
      expect(Banjo.notes('gm')).to eq(['g','a#','d'])
    end
  end
  describe ".shape" do
    it "given nothing writtens strings" do
      shape = %{
      D|G|B|D
      -|-|-|-
      -|-|-|-
      -|-|-|-
      -|-|-|-
      }
      expect(Banjo.shape()).to eq(shape)
    end
    it "given a major chord returns shape" do
      shape = %{
      D|G|B|D
      -|-|x|-
      x|-|-|x
      -|-|-|-
      -|-|-|-
      }
      expect(Banjo.shape('c')).to eq(shape)
    end
  end
end
