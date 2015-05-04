require_relative 'address'

class Person
  attr_accessor :first_name, :last_name
  attr_accessor :email, :address

  def initialize(first_name, last_name, email, address)
    @first_name = first_name
    @last_name  = last_name
    @email      = email
    @address    = address
  end

  def full_name
    @first_name + " " + @last_name
  end

  def to_s
    full_name + ", " + @email.to_s + "\n" + @address.to_s
  end
end
