describe "all?" do
    list = [2, 4, 6, 10]
    Test.assert_equals(all?(list){|item| item.even?}, true, "all evens should return true")
    Test.assert_equals(all?(list){|item| item < 10 }, false, "not all items are less than ten")
    Test.assert_equals(all?(list){|item| item.odd?}, false, "no items are odd")
    Test.assert_equals(all?([]){|item| item.even?}, true, "and empty list should return true")
end
