# Input = "aabbcde" Output = "2a2b1c1d1e"
# Input = "wwwbbbw" Output = "3w3b1w"

str1 = "aabbcde"
str2 = "wwwbbbw"

def convert_str(str)
  result_ary = []
  ary = str.split('')

  first_value = ary.slice!(0)
  result_ary << [first_value]

  ary.each_index do |i|
    if ary[i] == result_ary.last.first
      result_ary.last.push(ary[i])
    else
      result_ary << [ary[i]]
    end
  end

  result = ""
  result_ary.each do |char_set|
    count = char_set.size
    char = char_set.first

    result += count.to_s + char
  end

  result
end

convert_str(str1) == "2a2b1c1d1e"
convert_str(str2) == "3w3b1w"