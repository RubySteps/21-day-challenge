 require './string_calculator'

 describe StringCalculator do

   before :each do
     @calculator = StringCalculator.new
   end

   it "#add returns 0 for an empty string" do
     expect(@calculator.add("")).to eq 0
   end

   it "#add returns the parameter when only a number is given" do
     expect(@calculator.add("1")).to eq 1
     expect(@calculator.add("3")).to eq 3
   end

   it "#add returns the sum of a list of comma separated numbers" do
     expect(@calculator.add("1,2,3,4,5,6")).to eq 21
   end
 end
