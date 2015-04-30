require 'tiny_test/autorun'

TinyTest.specify "reporting results" do
  must "report_result_of_running_a_failing_and_passing_test" do
    result = TinyTest::Result.new
    TinyTest.run_all([
      TinyTest::TestCase.define { fail },
      TinyTest::TestCase.define {}
    ], result)

    assert_equal 2, result.run_count
    assert_equal 1, result.passed_count
    assert_equal 1, result.failed_count
  end

  must "report_test_failure_details" do
    the_exception = StandardError.new("this error")
    failing_test = TinyTest::TestCase.define { raise the_exception }
    result = TinyTest::Result.new

    TinyTest.run_all([failing_test], result)

    assert result.failures.include?(TinyTest::Failure.new(failing_test, the_exception))
  end
end
