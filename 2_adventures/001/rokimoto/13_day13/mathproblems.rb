class MathProblems
  def initialize 
    @addition = {
      "2 + 2" => 4,
      "5 + 5" => 10,
      "3 + 7" => 10,
      "6 + 5" => 11
    }

    @subtraction = {
      "10 - 2" => 8,
      "9 - 3" => 6,
      "15 - 5" => 10,
      "7 - 4" => 3
    }

    @multiplication = {
      "3 * 9" => 18,
      "2 * 6" => 12,
      "7 * 5" => 35,
      "5 * 1" => 5
    }

    @division = {
      "8 / 2" => 4,
      "6 / 3" => 2,
      "15 / 5" => 3,
      "12 / 4" => 3
    }
  end

  def display_questions (set = {}) 
    set.each do |key, value|
      while true
          print "#{key} = " 
          x = gets.chomp.to_i
          if x == value
            break
          end
        end
    end

    puts "You are smart"
  end

  def choose_set
    puts "What would you like to practice today?"
    puts "(a) addition, (b) subtraction, (c) multiplication, (d) division" 
    print ">"
    input = gets.chomp

    case input
    when "a"
      display_questions @addition
    when "b"
      display_questions @subtraction
    when "c"
      display_questions @multiplication
    when "d"
      display_questions @division
    else
      puts "That is not an option"
      choose_set
    end
  end

  def run
    choose_set
  end

end

math_problems = MathProblems.new
math_problems.run