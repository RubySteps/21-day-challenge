require 'active_support/core_ext/time/zones'

module TimeZoneHelper

  def self.calculate_current_difference_in_hours zone1, zone2
    Time.zone = zone1
    offset1 = Time.zone.now.utc_offset
    Time.zone = zone2
    offset2 = Time.zone.now.utc_offset
    (offset1 - offset2)/3600
  end
  
end
