require "open-uri"

remote_url = "https://www.google.com/"

remote_data = open(remote_url).read
file = open("test.html", "w")
file.write(remote_data)
file.close