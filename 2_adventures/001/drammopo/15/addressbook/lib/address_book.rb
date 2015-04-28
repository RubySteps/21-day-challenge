require_relative 'address'
require_relative 'person'


class AddressBook
  include Enumerable
  #
  # Fundementals methods: intialize, add, remove
  #
  def initialize
    @persons = []
  end

  def add(person)
    @persons << person
    sort
  end

  def remove(person)
    @person.delete(person)
  end

  #
  # Iterators: each, each_address
  #
  def each
    @persons.each { |p| yield p }
  end

  def each_address
    @persons.each{ |p| yield  p.address }
  end

  #
  # Sorting function.
  #
private

  def by_name(person_a, person_b)
    if person_a.first_name == person_b.first_name
      person_a.last_name <=> person_b.last_name
    else
      person_a.first_name <=> person_b.first_name
    end
  end

protected

  def sort()
    @persons = @persons.sort{ |a, b| by_name(a,b)}
  end
end
