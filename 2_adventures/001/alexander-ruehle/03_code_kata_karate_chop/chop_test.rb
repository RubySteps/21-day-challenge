require_relative 'chop'
require 'test/unit'

class ChopTest < Test::Unit::TestCase

  def test_chop
    assert_equal(-1, Chop.chop(3, []))
    assert_equal(-1, Chop.chop(3, [1]))
    assert_equal(0,  Chop.chop(1, [1]))
    #
    assert_equal(0,  Chop.chop(1, [1, 3, 5]))
    assert_equal(1,  Chop.chop(3, [1, 3, 5]))
    assert_equal(2,  Chop.chop(5, [1, 3, 5]))
    assert_equal(-1, Chop.chop(0, [1, 3, 5]))
    assert_equal(-1, Chop.chop(2, [1, 3, 5]))
    assert_equal(-1, Chop.chop(4, [1, 3, 5]))
    assert_equal(-1, Chop.chop(6, [1, 3, 5]))
    #
    assert_equal(0,  Chop.chop(1, [1, 3, 5, 7]))
    assert_equal(1,  Chop.chop(3, [1, 3, 5, 7]))
    assert_equal(2,  Chop.chop(5, [1, 3, 5, 7]))
    assert_equal(3,  Chop.chop(7, [1, 3, 5, 7]))
    assert_equal(-1, Chop.chop(0, [1, 3, 5, 7]))
    assert_equal(-1, Chop.chop(2, [1, 3, 5, 7]))
    assert_equal(-1, Chop.chop(4, [1, 3, 5, 7]))
    assert_equal(-1, Chop.chop(6, [1, 3, 5, 7]))
    assert_equal(-1, Chop.chop(8, [1, 3, 5, 7]))
  end

end