require 'minitest/autorun'
require_relative 'time_zone_helper.rb'

class TimeZoneDifferenceTest < MiniTest::Test

  def test_same_time_zone
    result = TimeZoneHelper.calculate_current_difference_in_hours "Paris", "Berlin"
    assert_equal(0, result)
  end

  def test_earlier_time_zone_first
    result = TimeZoneHelper.calculate_current_difference_in_hours "Madrid", "Eastern Time (US & Canada)"
    assert_equal(6, result)
  end

  def test_later_time_zone_first
    result = TimeZoneHelper.calculate_current_difference_in_hours "Eastern Time (US & Canada)", "Madrid"
    assert_equal(-6, result)
  end

end
