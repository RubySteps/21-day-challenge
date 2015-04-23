require 'open-uri'
require 'nokogiri'

class ImageDownloader

	def initialize
		@queue = Queue.new
	end

	def extractImgUrls(url)
		# extract urls and add to queue
		doc = Nokogiri::HTML(open(url))
		img_srcs = doc.css('img').map {|i| i['src']}.uniq

		#push the urls into the queue
		img_srcs.each do |src|
			 if ( ! src.match(/http:\/\//))
			 	src = src.gsub("//", "http://")
			 end
			 s = src.match(/http:\/\//) ? src : "#{url}/#{src}" 
			 puts s
			 @queue << s
		end
	end

	# take urls from the queue, download and store in a directory
	def downloadImgs(path)
		threads = []
		5.times { 
			threads << Thread.new {
				if !@queue.empty?
					img_src = @queue.pop
					image = open(img_src)
					names = img_src.split("/")
					name = names[names.length - 1]
					File.open("#{path}/#{name}", "wb") {|file| file.write(image.read)}
				end
			}
		}
		threads.each {|thr| thr.join}
	end

	#returns the number of images downloaded
	def numImages(path)
		Dir.entries(path).size
	end
end

imgDldr = ImageDownloader.new
imgDldr.extractImgUrls('http://www.stackoverflow.com')
imgDldr.downloadImgs('C:/images')
puts imgDldr.numImages('C:/images')