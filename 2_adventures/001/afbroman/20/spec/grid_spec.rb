require 'spec_helper'

describe Grid do
  describe 'initialize' do
    it 'creates a grid with given rows and columns' do
      grid = Grid.new(10, 10)
      expect(grid.rows).to eq 10
      expect(grid.columns).to eq 10
    end
  end

  describe 'each_cell' do
    it 'yields each cell in the grid' do
      grid = Grid.new(5, 5)
      rows = []
      columns = []
      grid.each_cell do |cell|
        rows << cell.row
        columns << cell.column
      end
      p rows
      p columns
    end


  end
end
