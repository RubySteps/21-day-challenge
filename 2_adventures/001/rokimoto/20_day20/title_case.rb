def title_case(title, minor_words = "")
    minor_words = minor_words.split(" ").each { |i| i.downcase! }
    title = title.split(" ").each.with_index do |item, idx|
        item.downcase!
        item.capitalize! unless minor_words.include? (item)
        if idx == 0
            item.capitalize!
        end
    end
    title.join(' ')
end