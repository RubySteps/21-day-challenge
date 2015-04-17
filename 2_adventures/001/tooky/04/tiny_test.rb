class AssertionFailed < StandardError; end

def assert(condition)
  raise AssertionFailed unless condition
end

class TinyTest
  def self.run(test, result=Result.new(0,0,0))
    begin
      test.call
    rescue
      result.add_failure(test)
    else
      result.passed_count += 1
    ensure
      result.run_count += 1
    end
    result
  end

  def self.run_all(*tests)
    result = Result.new(0, 0, 0)
    tests.each do |test|
      run(test, result)
    end
    result
  end

  class Result < Struct.new(:run_count, :passed_count, :failed_count)
    def add_failure(test)
      self.failed_count += 1
    end
  end
end

assert_does_not_raise_for_true_condition = -> () {
  assert(1 + 1 == 2)
}.call

assert_raises_for_false_condition = -> () {
  begin
    assert(1 + 1 != 2)
  rescue AssertionFailed
    raised = true
  else
    fail
  end
}.call

report_result_of_single_passing_test = -> () {
  result = TinyTest.run(
    ->() {}
  )
  assert 1 == result.run_count
  assert 1 == result.passed_count
  assert 0 == result.failed_count
}.call

report_result_of_single_failing_test = -> () {
  result = TinyTest.run(
    ->() { fail }
  )
  assert 1 == result.run_count
  assert 0 == result.passed_count
  assert 1 == result.failed_count
}.call

report_result_of_running_a_failing_and_passing_test = -> () {
  result = TinyTest.run_all(
    ->() {},
    ->() { fail }
  )

  assert 2 == result.run_count
  assert 1 == result.passed_count
  assert 1 == result.failed_count
}.call

puts "Success!"
