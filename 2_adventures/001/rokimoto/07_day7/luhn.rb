def validate_cc (n)
    sum = 0
    n = n.to_s.split("").reverse!
    n.map.with_index do |elem, i|
        n[i] = n[i].to_i
        if i.odd?
            n[i] *= 2
                if n[i] > 9
                    n[i] -= 9
                end
        end
    end
    n.each {|n| sum += n}
    sum % 10 == 0 ? true : false
end