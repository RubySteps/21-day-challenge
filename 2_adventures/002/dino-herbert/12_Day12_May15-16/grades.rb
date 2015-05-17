#Program takes a set of numbers within a certain range and averages them.
#Prompts user for correct input if number is out of range.
def set_counters
  @score_count = 0
  @score_total = 0
end
  
def show_instructions
  puts <<-EOS
**Test Score Average Calculator**

Please input exam scores that range between 0 and 100.
Input 'stop' to stop.

  EOS
end

def invalid_num?(number, min = 0, max = 100)
  case
  when number < 0
    'SMALL'
  when number > 100
    'LARGE'
  end
end

def keep_score(exam_score)
  @score_count += 1
  @score_total += exam_score
end

def show_results
  puts <<-EOS

Scores counted: #{@score_count} 
Score Total:    #{@score_total} 
Average Score:  #{@avg_score.round(3)}
  EOS
end

set_counters
show_instructions

until 'stop' == input = gets.chomp
  wrong = invalid_num?(input.to_f)
  wrong ? puts("Number is too #{wrong}") : keep_score(input.to_f)
  puts 'Input another test score:' 
end

@avg_score = @score_total / @score_count
show_results

