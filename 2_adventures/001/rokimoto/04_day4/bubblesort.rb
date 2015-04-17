def bubble_sort list
    x = list.length-2

    while x != 0
        for i in 0..x
            if list[i] > list[i+1]
                list[i], list[i+1] = list[i+1], list[i]
            end
        end
        x = x-1;
    end

    list
end