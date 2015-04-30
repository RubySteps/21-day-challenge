class Address
  attr_accessor :street, :city, :state, :zip
  def initialize()
    @street = @city = @state = @zip = ""

  end

  def to_s
    "    " + @street + "\n" + \
    "    " + @city + "\n" + \
    "    " + @state + ", " + @zip
  end
end
