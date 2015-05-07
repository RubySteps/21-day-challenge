f = File.open('test.txt')
input_text = f.read
f.close
output_text = Array.new
input_text.each_line {|line| output_text << line }
print output_text
