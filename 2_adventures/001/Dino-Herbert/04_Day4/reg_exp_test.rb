sample_string = "</a></td><td align=right>Final</td></tr><tr><td><a href=>TOR (3) @ NYY (4)</a></td><td align=right>Final</td></tr><tr><td><a href=>TEX (0) @ OAK (10)</a></td><td align=right>Final</td></tr><tr><td><a href="

pattern = /[A-Z]+ .[0-9]+. @ [A-Z]+ .[0-9]+./

result = sample_string.scan(pattern)

puts "From string"
puts result

puts "\nFrom file"
File.open("test_html.html").each { |line| puts line.scan(pattern) }

#next, I will try it from http:





