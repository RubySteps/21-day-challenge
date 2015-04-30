def convert_rovarspraet str
  vowels = ['a', 'e', 'i', 'o', 'u']
  new_string = []

  for i in (0..str.length-1)
    if str[i] =~ (/[a-zA-Z]/)
      vowels.include?(str[i]) ? new_string << str[i] : new_string << "#{str[i]}o#{str[i].downcase}"
    else
      new_string << str[i]
    end
  end

  new_string.join()
end