require_relative 'grid'

describe Grid do
  describe 'initialize' do
    it 'creates a grid with given rows and columns' do
      grid = Grid.new(10, 10)
      expect(grid.rows).to eq 10
      expect(grid.columns).to eq 10
    end
  end
end
