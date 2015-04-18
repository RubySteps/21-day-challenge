# Given two integers find maximal value of A xor B
#
# doctest: I pass in 2 values to get maximum xor value
# >> maxXor(10, 15)
# => 7

def maxXor(l, r)
  xor_max = []
  while l <= r
    if l == r
      xor_max << (l ^ l)
    else
      xor_max << (l ^ (l + 1))
    end
    l += 1
  end
  xor_max.max
end

l = gets.to_i
r = gets.to_i

print maxXor(l, r)
