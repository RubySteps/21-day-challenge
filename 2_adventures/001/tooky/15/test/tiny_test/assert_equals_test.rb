require 'tiny_test/autorun'

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
