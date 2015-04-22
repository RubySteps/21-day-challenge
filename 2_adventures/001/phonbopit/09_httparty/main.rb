require 'httparty'

class FacebookGraph
	include HTTParty

	attr_reader :base_uri, :name, :website, :likes, :about

	def initialize
		@base_uri = 'http://graph.facebook.com/facebook'
	end

	def get_data
		response = self.class.get(base_uri)
		if response.success?
			@name = response["name"]
			@website = response["website"]
			@likes = response["likes"]
			@about = response["about"]
		else
			raise response.response
		end
	end

end

graph_api = FacebookGraph.new

graph_api.get_data

puts "Name : #{graph_api.name}"
puts "About : #{graph_api.about}\n"
puts "Website : #{graph_api.website}"
puts "Total Likes : #{graph_api.likes}"