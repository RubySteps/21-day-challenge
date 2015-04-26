require 'grid'

describe Grid do
  it "has a user specified size" do
    grid = Grid.new(9)
    expect(grid.size).to eq 9
  end

  it "can have content placed on it" do
    grid = Grid.new(9)
    ship = double(:content)
    grid.place(ship)
    expect(grid.contents.count).to eq 1
  end
end