require 'tiny_test/autorun'








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
