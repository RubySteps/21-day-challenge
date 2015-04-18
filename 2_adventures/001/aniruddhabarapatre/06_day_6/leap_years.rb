# Write a program which will ask for a starting year and an ending year,
# and then puts all of the leap years between them (and including them,
# if they are also leap years)
#
# doctest: I pass in year 2004 and it returns true
# >> leap_year? 2004
# => true
#
# doctest: I pass in year 2005 and it returns false
# >> leap_year? 2005
# => false
#
# doctest: I pass in year 1996 and it returns true
# >> leap_year? 1996
# => true

def leap_year? year
  year % 4 == 0 && year % 100 != 0 || year % 400 == 0
end

if __FILE__ == $PROGRAM_NAME
  start_year = gets.to_i
  end_year = gets.to_i

  (start_year..end_year).to_a.each do |year|
    if leap_year?(year)
      print "#{year} "
    end
  end
end
