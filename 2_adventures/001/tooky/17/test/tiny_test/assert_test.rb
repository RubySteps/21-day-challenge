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

