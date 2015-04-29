def chop (num, array)
  result = array.index(num) 
  result = -1 if array.index(num) == nil
  result
end
