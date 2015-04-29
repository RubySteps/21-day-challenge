def rhyme (input)
  name = input.split("")
  d = input.split("").first
  name.delete(d)
  name = name.join('')

  puts  "#{input}, #{input} bo B#{name}, Bonana fana fo F#{name}, Fee fy mo M#{name}, #{input} !"
end