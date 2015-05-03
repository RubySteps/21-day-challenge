require_relative 'test_helper'

class TestPerson < Minitest::Test

  def setup
    @address = Minitest::Mock.new
    @person = Person.new
    @another_person = Person.new
    @another_person.first_name = "Joe"
    @another_person.last_name  = "Smith"
    @another_person.email = "joe.smith@example.com"
    @another_person.address = @address
  end

  def test_is_a_person
    assert_kind_of Person, @person
  end

  def test_initializes_without_a_first_name
    assert_nil @person.first_name
  end

  def test_initializes_without_a_last_name
    assert_nil @person.last_name
  end

  def test_initializes_without_an_email
    assert_nil @person.email
  end

  def test_initializes_without_an_address
    assert_nil @person.address
  end

  def test_has_a_first_name
    assert_equal "Joe", @another_person.first_name
  end

  def test_has_a_last_name
    assert_equal "Smith", @another_person.last_name
  end

  def test_has_a_full_name
    assert_equal "Joe Smith", @another_person.full_name
  end

  def test_has_an_email
    assert_equal "joe.smith@example.com", @another_person.email
  end

  def test_has_an_address
    # not sure how to implement this
    skip
    assert_kind_of Address, @another_person.address
  end

  def test_can_be_represented_as_a_string
    skip
  end

end
