require 'minitest/autorun'

require_relative 'answering_machine'

class AnsweringMachineTest < Minitest::Test

  def test_1
    message = "Hello?"
    assert_equal message, AnsweringMachine.record(message)
  end

  def test_2
    message = "That is smashing"
    assert_equal message + "?", AnsweringMachine.record(message)
  end

  def test_3
    message = 1
    assert_equal "1?", AnsweringMachine.record(message)
  end

  def test_4
    message = "Shine bright!??"
    assert_equal "Shine bright?", AnsweringMachine.record(message)
  end
end  