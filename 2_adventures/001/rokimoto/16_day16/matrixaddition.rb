def matrixAddition(a, b)
  addition_array = Array.new
  a.length.times do 
    slot = Array.new(a.length)
    addition_array << slot
  end
        
  for i in (0..a.length-1) do
    for x in (0..a.length-1) do
      addition_array[x][i] = a[x][i] + b[x][i]
    end
  end
  addition_array
end