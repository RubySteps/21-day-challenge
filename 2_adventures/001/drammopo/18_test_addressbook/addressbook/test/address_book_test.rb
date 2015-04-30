require_relative "test_helper"
require_relative '../lib/address_book'

class TestAddressBook < Minitest::Test

  def setup
    @address_book      = AddressBook.new

    @address           = Address.new
    @address.street    = "23 St George St."
    @address.city      = "Silver Spring"
    @address.state     = "MD"
    @address.zip       = "20465"

    @person            = Person.new
    @person.first_name = "Joe"
    @person.last_name  = "Smith"
    @person.email      = "joe.smith@example.com"
    @person.address    = @address
  end

  def test_is_an_address_book
    assert_kind_of AddressBook, @address_book
  end

  def test_can_add_a_contact
    assert_equal 1, @address_book.add(@person).size
  end
end
