require 'httparty'
require 'awesome_print'

class FacebookGraph
  include HTTParty

  attr_reader :base_uri, :name, :website, :likes, :about, :description, :awards, :city, :street, :state

  def initialize
    @base_uri = 'http://graph.facebook.com/github'
  end

  def get_data
    response = self.class.get(base_uri)
    if response.success?
      @name = response["name"]
      @website = response["website"]
      @likes = response["likes"]
      @about = response["about"]
      @description = response["description"]
      @awards = response["awards"]
      @city = response['location']['city']
      @street = response['location']['street']
      @state = response['location']['state']
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
puts "---" * 5
puts "Total Likes : #{graph_api.likes}"
puts "Description : #{graph_api.description}"
puts "wards : #{graph_api.awards}"
puts "---" * 5
puts "City Name : #{graph_api.city}"
puts "Location Street : #{graph_api.street}"
puts "Location State : #{graph_api.state}"
