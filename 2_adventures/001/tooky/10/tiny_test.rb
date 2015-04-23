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

  def self.run_all(tests, result=Result.new)
    tests.each do |test|
      run(test, result)
    end
    result
  end

  def self.specify(name, &block)
    Suite.new.tap { |s| s.instance_exec(&block) }
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

  class Suite
    def initialize
      @tests = []
    end

    def must(name, &test)
      add(test)
    end

    def each(*args, &block)
      @tests.each(*args, &block)
    end

    private

    def add(test)
      @tests << test
      self
    end
  end
end

assert_spec = TinyTest.specify "assert" do
  must "assert_does_not_raise_for_true_condition" do
    assert(1 + 1 == 2)
  end

  must "assert_raises_for_false_condition" do
    begin
      assert(1 + 1 != 2)
    rescue AssertionFailed
      raised = true
    else
      fail
    end
  end

  must "assert_default_message" do
    begin
      assert(1 + 1 != 2)
    rescue AssertionFailed => fail
      assert fail.message == "Expected assertion to be to true, was false."
    end
  end

  must "set_a_custom_assert_message" do
    begin
      assert(1 + 1 != 2, "In a parallel universe, 1+1 is not 2.")
    rescue AssertionFailed => fail
      assert fail.message == "In a parallel universe, 1+1 is not 2."
    end
  end
end

assert_equal_spec = TinyTest.specify "assert_equal" do
  must "assert_equal_does_not_raise_when_values_are_equal" do
    expected = 2
    actual   = 1 + 1
    assert_equal expected, actual
  end

  must "assert_equal_raises_assertion_failed_when_not_equal" do
    expected = 2
    actual   = 1 + 2
    begin
      assert_equal expected, actual
    rescue AssertionFailed
    else
      fail "Should have raised"
    end
  end

  must "default_message_for_assert_equal" do
    expected = 2
    actual   = 1 + 2
    begin
      assert_equal expected, actual
    rescue AssertionFailed => failure
      assert_equal "Expected '2' to `==` '3'", failure.message
    end
  end

  must "custom_message_for_assert_equal" do
    expected = "Hello, world!"
    actual   = "Hello" + "World"

    begin
      assert_equal expected, actual, "Hello world requires punctuation!"
    rescue AssertionFailed => failure
      assert_equal "Hello world requires punctuation!", failure.message
    end
  end
end

running_a_single_test_spec = TinyTest.specify "running a single test" do
  must "report_result_of_single_passing_test" do
    result = TinyTest.run(
      ->() {}
    )
    assert_equal 1, result.run_count
    assert_equal 1, result.passed_count
    assert_equal 0, result.failed_count
  end

  must "report_result_of_single_failing_test" do
    result = TinyTest.run(
      ->() { fail }
    )
    assert_equal 1, result.run_count
    assert_equal 0, result.passed_count
    assert_equal 1, result.failed_count
  end
end

reporting_tests_spec = TinyTest.specify "reporting results" do
  must "report_result_of_running_a_failing_and_passing_test" do
    result = TinyTest.run_all([
      ->() { fail },
      ->() {}
    ])

    assert_equal 2, result.run_count
    assert_equal 1, result.passed_count
    assert_equal 1, result.failed_count
  end

  must "report_test_failure_details" do
    the_exception = StandardError.new("this error")
    failing_test = ->() { raise the_exception }

    result = TinyTest.run_all([failing_test])

    assert result.failures.include?(TinyTest::Failure.new(failing_test, the_exception))
  end
end

suite_spec = TinyTest.specify "creating a suite of tests" do
  must "run_a_suite_of_tests" do
    suite = TinyTest.specify "addition" do
      must "sum positive numbers" do
        assert_equal 5, 1 + 4
      end

      must "sum negative and positive numbers together" do
        assert_equal 5, -2 + 7
      end
    end

    result = TinyTest.run_all(suite)

    assert_equal 2, result.run_count
    assert_equal 2, result.passed_count
  end
end

result = TinyTest::Result.new

TinyTest.run_all(assert_spec, result)
TinyTest.run_all(assert_equal_spec, result)
TinyTest.run_all(running_a_single_test_spec, result)
TinyTest.run_all(reporting_tests_spec, result)
TinyTest.run_all(suite_spec, result)

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
