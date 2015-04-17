#!/usr/bin/env ruby
# postcode.rb
# Works with an API without authenication

require 'open-uri'
require 'json'

class Postcode
	attr_accessor :enter_postcode

	def enter_postcode
		puts "Please enter a postcode"
		post_code = gets.chomp.gsub(" ", "")
		if (post_code.length == 6) || (post_code.length == 7)
			@postcode = post_code
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
		info = results["result"]
		
		info.each do |key, value|
			puts "#{key} : #{value}"
		end
	end

end

if __FILE__ == $0

	postcode = Postcode.new
	postcode.enter_postcode

end