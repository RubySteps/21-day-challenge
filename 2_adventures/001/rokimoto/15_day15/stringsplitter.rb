  def solution(str)
    new_arr = []
    i = 0
    str.length % 2 == 0 ? x = str.length / 2 : x = str.length / 2 + 1

    x.times do 
       y =  str[0+i..1+i]
       if y.length == 1 
           y += "_"
        end
        new_arr << y
        i += 2
    end
    new_arr
end