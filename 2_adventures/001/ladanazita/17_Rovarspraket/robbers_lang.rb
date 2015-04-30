def rovarspraket(string)
  string.gsub(/(^[aeiou]&&[b-df-hj-np-tv-z])o\1/i, '\1')
end
