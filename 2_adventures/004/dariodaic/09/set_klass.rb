# About:
# * set is a collection of unordered and unique elements.
# * Object#eql? is used for ensuring uniqueness of objects.
# Q: how are Strings added in this case?
# * its internal storage mechanism is based off hash keys, which are also unique.
# * spaceship operator is left out. <, >, <=, >= are shorthand for 'proper_', 'subset?', 'superset?'.

# Takeaway points:
# * it is a part of the Ruby standard library, and not the Core.
# * since it is a part of Stdlib, it's implemented in Ruby.
# * it has to be required - 'require "set"'.

require "set"

# 1. CREATING A SET
alpha = Set.new(["A", "B", "C"])
beta = Set.new(["c", "d", "e"]) { |obj| obj.upcase }
gamma = [1, 2, 3].to_set

# using '.each' defined on a class
class Triplet
  attr_accessor :collection

  def initialize(array)
    @collection = array.compact
  end

  # implement .each_entry to demonstrate

  def each
    counter = 0
    while @collection[counter]
      yield @collection[counter...counter+=3]
    end
    self
  end
end

triplet = Triplet.new [1,2,3,4,5,6,7,8]
p triplet_set = Set.new(triplet)

# 2. BASIC OPERATIONS
alpha.add("D")
# => #<Set: {"A", "B", "C", "D"}>
alpha.delete("D")
# => #<Set: {"A", "B", "C"}>

# 3. SET INTERACTIONS
alpha + beta                                               # UNION: Set#union, alias: Set#+, Set#|
# => #<Set: {"A", "B", "C", "D", "E"}>
alpha - beta                                               # DIFFERENCE: Set#difference, alias: Set#-
# => #<Set: {"A", "B"}>
alpha & beta                                               # INTERSECTION: Set#intersection
# => #<Set: {"C"}>
p alpha ^ beta                                             # EXCLUSIVE-OR
# => #<Set: {"A", "B", "D", "E"}>

# Set#merge
gamma.merge(beta)                                          # Set#merge IS a bang method
# => #<Set: {"1", "2", "3", "C", "D", "E"}>
gamma = gamma - beta

gamma.merge(triplet_set)
# => #<Set: {"1", "2", "3", [1,2,3], [4,5,6], [7,8]}>
gamma = gamma - triplet_set

hash = {a: 100, b: 200, c: 300}
# Q: what will be the contents of gamma, if we merge it with hash?
puts "HERE"
p gamma.merge(hash)

# 4. SUBSETS AND SUPERSETS
ps = Set.new(["B", "C"])
ss = Set.new(["A", "B", "C"])

p ps.proper_subset?(alpha)
p ss.subset?(alpha)

# 5. Set#include?, Set#add and Set#add?
puts "Check can be performed if a set contains an element." if alpha.include?("B")
puts "#add? returns 'self' or 'nil'. It can be used for conditional expressions." if alpha.add?("D")

# 6. SETS CAN CONTAIN SETS
simple_set = Set.new([:a, :b, :c])
gamma.clear
gamma << simple_set
