require 'rubygems'
require 'bundler/setup'
require 'levenshtein'

class Sentence
  attr_reader(:text)
  attr_accessor(:user_time, :distance, :computer_time)

  def initialize(text, computer_time=0)
    @text = text
    @computer_time = computer_time
    @user_time = nil
    @distance = nil
  end
end

# Construct sentences
sentences = [
  Sentence.new('A stich in time saves nine', 3.895894),
  Sentence.new('Pat writes ruby', 3.527742),
  Sentence.new('An elevator shaft was found levitating', 5.191806),
  Sentence.new('$this->language = "something you probably hate";', 10.031146),
  Sentence.new('Pain And Tragedy is laMented A hunDreD and One times anXiously', 11.167742)
]

sentences.each{|sentence|
  puts sentence.text
  print "> "

  start = Time.now
  user_input = gets.chomp
  finish = Time.now

  sentence.user_time = finish - start
  sentence.distance = Levenshtein.distance sentence.text, user_input
}

puts "\nSTATS\n\n"
sentences.each{|sentence|
  puts sentence.text
  print "You made #{sentence.distance} mistakes, and took #{sentence.user_time} seconds. I took #{sentence.computer_time} seconds."
  puts "\n\n"
}
