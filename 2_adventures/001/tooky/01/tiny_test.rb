def assert(condition)

end

assert(1 + 1 == 2)

raised = false
begin
  assert(1 + 1 != 2)
rescue AssertionFailed
  raised = true
end
raise unless raised

puts "Success!"
