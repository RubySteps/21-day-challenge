require 'tiny_test/autorun'

TinyTest.specify "running a single test" do
  must "report_result_of_single_passing_test" do
    test_case = TinyTest::TestCase.define {}
    result = TinyTest::Result.new

    test_case.run(result)

    assert_equal 1, result.run_count
    assert_equal 1, result.passed_count
    assert_equal 0, result.failed_count
  end

  must "report_result_of_single_failing_test" do
    result = TinyTest::Result.new
    test_case = TinyTest::TestCase.define { fail }

    test_case.run(result)

    assert_equal 1, result.run_count
    assert_equal 0, result.passed_count
    assert_equal 1, result.failed_count
  end
end
