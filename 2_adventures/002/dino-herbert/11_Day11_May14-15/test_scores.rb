def set_scores
  @score_count = 0
  @score_total = 0
end
  
def show_greeting
  puts <<-EOS
**Test Score Average Calculator**
Please input test scores that range between 0 and 100.
Input '999' to stop.
  EOS
end

set_scores
show_greeting

score = gets.to_f

while (score != 999)
  if (score < 0)
    puts "Number is too SMALL.  Score not counted - Try again."
    score = gets.to_f
  elsif (score > 100)
    puts "Number is too LARGE.  Score not counted - Try again."
    score = gets.to_f
  elsif (score <= 100 && score >= 0)
    @score_count += 1
    @score_total += score
    puts "Input score:  "
    score = gets.to_f
  end
end
 
avg_score = @score_total / @score_count
puts <<-EOS
Scores counted: #{@score_count} 
Score Total:    #{@score_total} 
Average Score:  #{avg_score.round(3)}
EOS
