require_relative 'spec_helper'
require 'fizz_buzz'

# Setup my object under test
MyFizzBuzz = Class.new
MyFizzBuzz.extend FizzBuzz

describe FizzBuzz do

  describe 'Single Numbers' do
    @fizz = 'Fizz'
    @buzz = 'Buzz'
    @both = @fizz + @buzz
    @result_samples = [
      # given, expected
      [1,    1],
      [2,    2],
      [3,    @fizz],
      [5,    @buzz],
      [15,    @both],
      [45,    @both]
    ]
                      .each do |given, expected|
      it " #{expected} for #{given}" do
        assert_equal expected, MyFizzBuzz.play(given)
      end
    end
  end

  describe 'Edge Cases' do
    it ' fizzbuzz for 0' do
      assert_equal 'FizzBuzz', MyFizzBuzz.play(0)
    end
    it ' -1 for -1' do
      assert_equal -1,  MyFizzBuzz.play(-1)
    end
  end

  describe '1 to 100' do
    it ' follows the rules' do
      @expected_results = [
        1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz', 11, 'Fizz', 13,
        14, 'FizzBuzz', 16, 17, 'Fizz', 19, 'Buzz', 'Fizz', 22, 23, 'Fizz',
        'Buzz', 26, 'Fizz', 28, 29, 'FizzBuzz', 31, 32, 'Fizz', 34, 'Buzz',
        'Fizz', 37, 38, 'Fizz', 'Buzz', 41, 'Fizz', 43, 44, 'FizzBuzz', 46, 47,
        'Fizz', 49, 'Buzz', 'Fizz', 52, 53, 'Fizz', 'Buzz', 56, 'Fizz', 58, 59,
        'FizzBuzz', 61, 62, 'Fizz', 64, 'Buzz', 'Fizz', 67, 68, 'Fizz', 'Buzz',
        71, 'Fizz', 73, 74, 'FizzBuzz', 76, 77, 'Fizz', 79, 'Buzz', 'Fizz', 82,
        83, 'Fizz', 'Buzz', 86, 'Fizz', 88, 89, 'FizzBuzz', 91, 92, 'Fizz', 94,
        'Buzz', 'Fizz', 97, 98, 'Fizz', 'Buzz'
      ]
      assert_equal @expected_results, (1..100).map { |number | MyFizzBuzz.play(number) }
    end
  end

end
