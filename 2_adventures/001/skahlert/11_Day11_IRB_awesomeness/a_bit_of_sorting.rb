# Just played around a bit with IRB today
# Needed to find the longest line in a text and the lines sorted alphabetically

text = <<-eos
Several lines of text here
...
of varying length
...
and with different letters at the beginning of each line
eos
lines = text.split("\n")
puts lines.sort.join("\n")
puts lines.sort { |a, b| a.length <=> b.length }.join("\n")
