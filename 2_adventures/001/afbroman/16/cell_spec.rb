require_relative 'cell'

describe Cell do
  let(:cell1) { Cell.new }
  let(:cell2) { Cell.new }

  describe 'link' do
    it 'links to another cell' do
      cell1.link(cell2)
      expect(cell1.links).to include cell2
      expect(cell1.linked?(cell2)).to eq true
    end

    it 'is linked to by the other cell' do
      cell1.link(cell2)
      expect(cell2.links).to include cell1
      expect(cell2.linked?(cell1)).to eq true
    end
  end

  describe 'unlink' do
    it 'unlinks from another cell' do
      cell1.link(cell2)
      cell1.unlink(cell2)
      expect(cell1.links).not_to include cell2
      expect(cell1.linked?(cell2)).to eq false
    end

    it 'is unlinked from the other cell' do
      cell1.link(cell2)
      cell1.unlink(cell2)
      expect(cell2.links).not_to include cell1
      expect(cell2.linked?(cell1)).to eq false
    end
  end
end
