require 'open-uri'

base_url = "http://en.wikipedia.org/wiki"
page1 = "Mikhail_Tal"
page2 = "Emanuel_Lasker"
file1 = "copy_of_" + page1 + ".html"
file2 = "copy_of_" + page2 + ".html"

full_url = base_url + "/" + page1
read_page = open(full_url).read

puts "Downloading from " + full_url

file = open(file1, "w")
file.write(read_page)
file.close

full_url = base_url + "/" + page2
read_page = open(full_url).read

puts "Downloading from " + full_url

file = open(file2, "w")
file.write(read_page)
file.close

combined_file = open("chess-guys.html", 'w')

read_local1 = open(file1, 'r')
read_local2 = open(file2, 'r')

combined_file.write(read_local1.read)
combined_file.write(read_local2.read)

read_local1.close
read_local2.close

puts "Done"