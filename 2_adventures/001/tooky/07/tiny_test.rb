class AssertionFailed < StandardError; end

def assert(condition, message="Expected assertion to be to true, was false.")
  unless condition
    raise AssertionFailed, message
  end
end

def assert_equal(expected, actual, message=nil)
  message ||= "Expected '#{expected.inspect}' to `==` '#{actual.inspect}'"
  assert expected == actual, message
end

class TinyTest
  def self.run(test, result=Result.new)
    begin
      test.call
    rescue Object => exception
      result.add_failure(test, exception)
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
    attr_reader :passed_count, :failed_count, :failures

    def initialize
      @passed_count = 0
      @failures = []
    end

    def add_failure(test, exception)
      @failures << Failure.new(test, exception)
    end

    def add_pass(test)
      @passed_count += 1
    end

    def failed_count
      failures.count
    end

    def run_count
      failed_count + passed_count
    end
  end

  class Failure < Struct.new(:test, :exception)
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

assert_default_message = -> () {
  begin
    assert(1 + 1 != 2)
  rescue AssertionFailed => fail
    assert fail.message == "Expected assertion to be to true, was false."
  end
}

set_a_custom_assert_message = -> () {
  begin
    assert(1 + 1 != 2, "In a parallel universe, 1+1 is not 2.")
  rescue AssertionFailed => fail
    assert fail.message == "In a parallel universe, 1+1 is not 2."
  end

}

assert_equal_does_not_raise_when_values_are_equal = -> () {
  expected = 2
  actual   = 1 + 1
  assert_equal expected, actual
}

assert_equal_raises_assertion_failed_when_not_equal = -> () {
  expected = 2
  actual   = 1 + 2
  begin
    assert_equal expected, actual
  rescue AssertionFailed
  else
    fail "Should have raised"
  end
}

default_message_for_assert_equal = -> () {
  expected = 2
  actual   = 1 + 2
  begin
    assert_equal expected, actual
  rescue AssertionFailed => failure
    assert_equal "Expected '2' to `==` '3'", failure.message
  end
}

custom_message_for_assert_equal = -> () {
  expected = "Hello, world!"
  actual   = "Hello" + "World"

  begin
    assert_equal expected, actual, "Hello world requires punctuation!"
  rescue AssertionFailed => failure
    assert_equal "Hello world requires punctuation!", failure.message
  end
}

report_result_of_single_passing_test = -> () {
  result = TinyTest.run(
    ->() {}
  )
  assert_equal 1, result.run_count
  assert_equal 1, result.passed_count
  assert_equal 0, result.failed_count
}

report_result_of_single_failing_test = -> () {
  result = TinyTest.run(
    ->() { fail }
  )
  assert_equal 1, result.run_count
  assert_equal 0, result.passed_count
  assert_equal 1, result.failed_count
}

report_result_of_running_a_failing_and_passing_test = -> () {
  result = TinyTest.run_all(
    ->() { fail },
    ->() {}
  )

  assert_equal 2, result.run_count
  assert_equal 1, result.passed_count
  assert_equal 1, result.failed_count
}

report_test_failure_details = -> () {
  the_exception = StandardError.new("this error")
  failing_test = ->() { raise the_exception }

  result = TinyTest.run_all(failing_test)

  assert result.failures.include?(TinyTest::Failure.new(failing_test, the_exception))
}

run_a_suite_of_tests = -> () {
  suite = TinyTest::Suite.new
  suite.add ->() {
    assert_equal 5, 1 + 4
  }
  suite.add ->() {
    assert_equal 4, -2 + 7
  }

  result = TinyTest.run_all(suite)

  assert_equal 2, result.run_count
  assert_equal 2, result.passed_count
}

result = TinyTest.run_all(
  assert_does_not_raise_for_true_condition,
  assert_raises_for_false_condition,
  report_result_of_single_passing_test,
  report_result_of_single_failing_test,
  report_result_of_running_a_failing_and_passing_test,
  report_test_failure_details,
  assert_default_message,
  set_a_custom_assert_message,
  assert_equal_does_not_raise_when_values_are_equal,
  assert_equal_raises_assertion_failed_when_not_equal,
  default_message_for_assert_equal,
  custom_message_for_assert_equal,
  run_a_suite_of_tests
)

if result.failures.any?
  puts "Tests Failed:"
  puts

  result.failures.each do |f|
    puts "  #{f.exception.class} - #{f.exception.message}"
    puts f.exception.backtrace.map { |s| "    #{s}" }
    puts
  end
end

puts "#{result.run_count} ran, #{result.passed_count} passed, #{result.failed_count} failed"

puts "Success!" if result.run_count == result.passed_count
