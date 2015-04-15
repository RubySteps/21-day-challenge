class AssertionFailed < StandardError; end

def assert(condition)
  raise AssertionFailed unless condition
end

assert(1 + 1 == 2)

begin
  assert(1 + 1 != 2)
rescue AssertionFailed
  raised = true
else
  fail
end

puts "Success!"
