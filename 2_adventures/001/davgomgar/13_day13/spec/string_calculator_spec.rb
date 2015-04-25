 require './string_calculator'

 describe StringCalculator do

   before :each do
     @calculator = StringCalculator.new
   end

   it "#add returns 0 for an empty string" do
     expect(@calculator.add("")).to eq 0
   end

   context "Works with a single value" do
    it "#add returns the parameter when only a number is given" do
     expect(@calculator.add("1")).to eq 1
     expect(@calculator.add("3")).to eq 3
    end
   end
   
   context "Adds list of comma separated numbers" do
      it "#add returns the sum of a list of comma separated numbers" do
        expect(@calculator.add("1,2,3,4,5,6")).to eq 21
      end
   end

   context "Works with other separator (single  and multi char separators)" do
    it "#add allows to use a line ending character as separator" do
       expect(@calculator.add("//[;]\n1;2;3;4")).to eq 10
    end
    it "#add allows to use a multichar separator" do
      expect(@calculator.add("//[===]\n1===2===4===50===1")).to eq 58 
    end
   end
   
   context "Ignores invalid numbers" do
     it "#add ignores numbers greater than 1000" do
       expect(@calculator.add("1,2,1003,3")).to eq 6
     end
   end
end
