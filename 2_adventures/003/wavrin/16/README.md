Today I thought about Ruby blocks. Specifically, one line ruby blocks vs. multi-line blocks.

The community seems pretty consistent. If it is one line, then you use brackets: 

```ruby
list = [1, 2, 3, 4, 5]

list.each { |n| puts "Number #{n}" }
```

But if it's mult-line, you use *do* and *end*. Of course, this code will still work:

```ruby
list = [1, 2, 3, 4, 5]

list.each do |n|
	puts "Number #{n}"
end
```

I definately follow the convention for one-line blocks. But doesn't it just look better using *do* and *end*? 



