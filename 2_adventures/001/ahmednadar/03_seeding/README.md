
I'm working on a project where, I want to create a table represent an object without adding to application schema. I thought seed file would be appropriate place. Here's my initial code:

```ruby
Category.delete_all
Category.create name: "Full Time"
Category.create name: "Part Time"
Category.create name: "Freelancer"
Category.create name: "Consulting"
```

I run bundle exec rake db:seed after run migration.

While it works fine, I felt like it's not "Rubyish" and has duplication. So I refactor it to:

```ruby
Category.delete_all
category_list = ["Full Time", "Part Time", "Freelancer", "Consulting"]

category_list.each do |cat|
  Category.create!(name: cat)
end
```

Now it looks nice and real Ruby.

Happy Coding :smiley_cat: