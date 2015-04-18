class AssertionFailed < StandardError; end

def assert(condition)
  raise AssertionFailed unless condition
end

class TinyTest
  def self.run(test, result=Result.new)
    begin
      test.call
    rescue
      result.add_failure(test)
    else
      result.add_pass(test)
    end
    result
  end

  def self.run_all(*tests)
    result = Result.new
    tests.each do |test|
      run(test, result)
    end
    result
  end

  class Result
    attr_reader :passed_count, :failed_count

    def initialize
      @passed_count = 0
      @failed_count = 0
    end

    def add_failure(test)
      @failed_count += 1
    end

    def add_pass(test)
      @passed_count += 1
    end

    def run_count
      failed_count + passed_count
    end
  end
end

assert_does_not_raise_for_true_condition = -> () {
  assert(1 + 1 == 2)
}

assert_raises_for_false_condition = -> () {
  begin
    assert(1 + 1 != 2)
  rescue AssertionFailed
    raised = true
  else
    fail
  end
}

report_result_of_single_passing_test = -> () {
  result = TinyTest.run(
    ->() {}
  )
  assert 1 == result.run_count
  assert 1 == result.passed_count
  assert 0 == result.failed_count
}

report_result_of_single_failing_test = -> () {
  result = TinyTest.run(
    ->() { fail }
  )
  assert 1 == result.run_count
  assert 0 == result.passed_count
  assert 1 == result.failed_count
}

report_result_of_running_a_failing_and_passing_test = -> () {
  result = TinyTest.run_all(
    ->() { fail },
    ->() {}
  )

  assert 2 == result.run_count
  assert 1 == result.passed_count
  assert 1 == result.failed_count
}

report_test_failure_details = -> () {
  the_exception = StandardError.new("this error")
  failing_test = ->() { raise the_exception }

  result = TinyTest.run_all(failing_test)

  assert result.failures.include?(Test::Failure.new(failing_test, the_exception))
}

result = TinyTest.run_all(
  assert_does_not_raise_for_true_condition,
  assert_raises_for_false_condition,
  report_result_of_single_passing_test,
  report_result_of_single_failing_test,
  report_result_of_running_a_failing_and_passing_test
)

puts "#{result.run_count} ran, #{result.passed_count} passed, #{result.failed_count} failed"

report_test_failure_details.call

puts "Success!" if result.run_count == result.passed_count
