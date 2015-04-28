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

TinyTest.specify "creating a suite of tests" do
  must "run_a_suite_of_tests" do
    suite = TinyTest.specify "addition" do
      must "sum positive numbers" do
        assert_equal 5, 1 + 4
      end

      must "sum negative and positive numbers together" do
        assert_equal 5, -2 + 7
      end
    end

    result = TinyTest::Result.new
    TinyTest.run_all(suite, result)

    assert_equal 2, result.run_count
    assert_equal 2, result.passed_count
  end

  must "add suite to the stack" do
    suite_stack = []

    suite = TinyTest.specify "do things", suite_stack do
      must "have a test" do
        assert(true)
      end
    end

    assert_equal suite, suite_stack.last
  end
end
