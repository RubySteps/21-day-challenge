$LOAD_PATH.unshift(File.expand_path(File.join(File.dirname(__FILE__), "../lib"))) unless $LOAD_PATH.include?(File.expand_path(File.join(File.dirname(__FILE__), "../lib")))

require 'tiny_test/autorun'

TinyTest.specify "assert" do
  must "assert_does_not_raise_for_true_condition" do
    assert(1 + 1 == 2)
  end

  must "assert_raises_for_false_condition" do
    begin
      assert(1 + 1 != 2)
    rescue TinyTest::Assertions::Failed
      raised = true
    else
      fail
    end
  end

  must "assert_default_message" do
    begin
      assert(1 + 1 != 2)
    rescue TinyTest::Assertions::Failed => fail
      assert fail.message == "Expected assertion to be to true, was false."
    end
  end

  must "set_a_custom_assert_message" do
    begin
      assert(1 + 1 != 2, "In a parallel universe, 1+1 is not 2.")
    rescue TinyTest::Assertions::Failed => fail
      assert fail.message == "In a parallel universe, 1+1 is not 2."
    end
  end
end

TinyTest.specify "assert_equal" do
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
    rescue TinyTest::Assertions::Failed
    else
      fail "Should have raised"
    end
  end

  must "default_message_for_assert_equal" do
    expected = 2
    actual   = 1 + 2
    begin
      assert_equal expected, actual
    rescue TinyTest::Assertions::Failed => failure
      assert_equal "Expected '2' to `==` '3'", failure.message
    end
  end

  must "custom_message_for_assert_equal" do
    expected = "Hello, world!"
    actual   = "Hello" + "World"

    begin
      assert_equal expected, actual, "Hello world requires punctuation!"
    rescue TinyTest::Assertions::Failed => failure
      assert_equal "Hello world requires punctuation!", failure.message
    end
  end
end

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
