require_relative 'test_helper'

class TestAddress < Minitest::Test

  def setup
    @address                = Address.new
    @another_address        = Address.new
    @another_address.street = "324 Campus Dr."
    @another_address.city   = "College Park"
    @another_address.state  = "MD"
    @another_address.zip    = "23659"
  end

  def test_is_an_address
    assert_kind_of Address, @address
  end

  def test_initializes_with_a_blank_street
    assert_equal "", @address.street
  end

  def test_initializes_with_a_blank_city
    assert_equal "", @address.city
  end

  def test_initializes_with_a_blank_state
    assert_equal "", @address.state
  end

  def test_initializes_with_a_blank_zip
    assert_equal "", @address.zip
  end

  def test_has_a_street
    assert_equal "324 Campus Dr.", @another_address.street
  end

  def test_has_a_city
    assert_equal "College Park", @another_address.city
  end

  def test_has_a_state
    assert_equal "MD", @another_address.state
  end

  def test_has_a_zip
    assert_equal "23659", @another_address.zip
  end

  def test_can_be_represented_as_a_string
    formatted_address = \
    "    324 Campus Dr.\n" + \
    "    College Park\n" + \
    "    MD, 23659"
    assert_equal formatted_address, @another_address.to_s
  end

end
