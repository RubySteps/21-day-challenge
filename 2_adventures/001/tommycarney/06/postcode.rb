#!/usr/bin/env ruby
# postcode.rb
# Works with an API without authenication

require 'open-uri'
require 'json'

class Postcode
	attr_accessor :enter_postcode
	attr_accessor :postcode
	attr_accessor :postcode_info

	def initialize
		@postcode_info = {}
	end

	def enter_postcode(options = {})
		puts "Please enter a postcode"
		if options[:postcode]
			postcode = options[:postcode].gsub(" ", "")
		else
			postcode =gets.chomp.gsub(" ", "")
		end
		if (postcode.length == 6) || (postcode.length == 7)
			@postcode = postcode
			display_postcode
		else
			puts "Not a valid postcode \nPostcodes must be 6 or 7 digits long"
			enter_postcode
		end
	end

	def json_request
		begin
		   result = JSON.parse(open("https://api.postcodes.io/postcodes/#{@postcode}").read)
		   if result
		      return result
		   end
		rescue
		     puts "The postcode was not valid"
		     return { "error" => 404 }
		end	
	end

	def display_postcode
		results = json_request
		return results if (results["error"] == 404)
		@postcode_info = results["result"]
		
		@postcode_info.each do |key, value|
			puts "#{key} : #{value}"
		end
	end

end

if __FILE__ == $0

	postcode = Postcode.new
	postcode.enter_postcode(options = {:postcode => "SW1A 0AA"})

end