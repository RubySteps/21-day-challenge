# Day 11

In yesterday's commit I used a named scope in a Rails model for finding partial matches within the title. I was asking myself if a named scope is the right way or if I should define a class method in this model. I used a snippet from a [demo app](https://github.com/nathanl/bookfinder) for `searchlight`, the Gem I'm using for search:

```ruby
class Author < ActiveRecord::Base

  # ...
  
  scope :name_like, -> name { where("concat(first_name, ' ', last_name) ILIKE ?", "%#{name}%") }

end
```

You get the same result by writing a class method:

```ruby
class Author < ActiveRecord::Base

  # ...
  
  def self.name_like(name)
    Author.where("concat(first_name, ' ', last_name) ILIKE ?", "%#{name}%") }
  end

end
```

My gut feeling was that simple named scopes are okay and that for more complicated conditions that don't fit into one line anymore using a class method would be the better approach. While researching I found [this answer](http://stackoverflow.com/a/7051169) on StackOverflow. In it the author presents his solution for a generic scope that you can use for `LIKE` queries in MySQL. It's quite ugly to read in my opinion. Another article that was published at Rails 3 time concluded that to avoid a bug in Arel it was better to use a class method. Since that bug has been resolved, it boils down to matter of personal preference — and that was also my first impression.

## Links

* [What's the best way to include a LIKE clause in a Rails query?](http://stackoverflow.com/questions/7051062/whats-the-best-way-to-include-a-like-clause-in-a-rails-query) on StackOverflow
* [Named Scopes Are Dead](http://www.railway.at/2010/03/09/named-scopes-are-dead/)