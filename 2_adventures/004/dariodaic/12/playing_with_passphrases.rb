def play_pass(string, n)
  alphabet = ("A".."Z").to_a
  az_get_index = {}
  az_get_letter = {}
  alphabet.each_with_index do |letter, index|
    az_get_index[letter] = index + 1
    az_get_letter[index + 1] = letter
  end

  string.split("").each_with_index do |char, index|
    if alphabet.include?(char)
      new_index = az_get_index[char] + n
      new_letter = az_get_letter[new_index <= alphabet.length ? new_index : new_index - alphabet.length]
      string[index] = index.even? ? new_letter.upcase : new_letter.downcase
    elsif ("0".."9").to_a.include?(char)
      string[index] = (9 - char.to_i).to_s
    end
  end
  string
end
p play_pass("AB!C", 1)
