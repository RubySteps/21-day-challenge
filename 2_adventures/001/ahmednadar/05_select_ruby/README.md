
 Usually when I need iterate over different type of Objects say an 'Array' I use [**each**](http://www.ruby-doc.org/core-2.1.2/Array.html#method-i-each) method, which is the core of all [Enumerable](http://www.ruby-doc.org/core-2.1.2/Enumerable.html) methods. 
 
 
 Lets say I have the following `class Student`.
 
```ruby 

class Student  
  attr_reader :first_name, :last_name, :grade	
    
  def initialize(first_name, last_name, grade)
    @first_name = first_name 
    @last_name = last_name
    @grade = grade
  end
     
  def to_s
    "#{first_name}, #{last_name}"
  end
end
``` 
### The Goal 

I want to iterate over all students and return a value based on a condition. Below I'm iterating over all students, return students with grade 11 and above and store them in the `seniors_students`  Array. 


### Initial solution 
The fist solution comes to my mind is to use `each` method. 
 
```ruby
def seniors(students)
    senior_students = []  
    students.each do |student|
      if student.grade >= 11
        senior_students.push(student)
      end
    return senior_students
end

ramy =  Student.new("Ramy", "Smith", 12)
tomas =  Student.new("Tomas", "James", 11)
gothom = Student.new("Gothom", "Man", 9)
freddy = Student.new("Freddy", "Benberg", 7)

all_students = [ahmed, tomas, gothom, freddy]
 
seniors(all_students).each do |student|
    puts student
end
```

All what `each` method cares about is how to visit each elements of the collection and rerun the value to the block passed. But it doesn't care about what is this collection and how it's stored, it's up to us.

Not only that, also using `each` is not simple. Here we are looping through ‘each’ element, and performing our check. ‘If’ the element meet our condition, add it to an array called `senior_students`. It works, but it’s long winded, and not very expressive. 


### A better way 

Since we are returning a new Array containing all elements of our collection for which the given block returns a true value (meet our condition), we can use the [`select`](http://www.ruby-doc.org/core-2.1.2/Array.html#method-i-select) method. 


In other way, select if what is in the end of the `do....end` block its true or exist.

Lets see how we can use select. 


```ruby
class Student
.
.
.
  def senior?
      grade >= 11
  end
.
.
.
end
def seniors(students)
    students.select {|student| student.senior? }
end
```

First we define a `senior?` method for students with grade 11 and above. Then we return `senior?` students only within `seniors(students)` method.

### Summary

The above example shows using select is much better. Because we don't need to create a new array before performing the check, no boilerplate [add the element to the new array] code, and no dirty ‘if’s; it's just nice expressive clean code reads as English and simple to understand.

Happy Coding :smile_cat: