## Day 9: 

### HTTParty 

Use HTTParty to 

##### FacebookGraph class:
```ruby
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

```
##### HTTP example:
```ruby
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
```


#### Output

```
Name : GitHub
About : GitHub's official Facebook page.
Website : GitHub.com
---------------
Total Likes : 51692
Description : GitHub is the best place to share code with friends, co-workers, classmates, and complete strangers. Over three million people use GitHub to build amazing things together.
wards : Best Overall Start-up • 2012 Crunchies (TechCrunch Awards)
Best Bootstrapped Start-up • 2008 Crunchies (TechCrunch Awards)
---------------
City Name : San Francisco
Location Street : 88 Colin P Kelly Jr St
Location State : CA
```