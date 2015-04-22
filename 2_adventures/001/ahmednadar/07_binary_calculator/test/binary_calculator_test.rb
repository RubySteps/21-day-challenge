Test.describe("Basic tests") do
  Test.assert_equals(calculate('1', '1', 'add'), '10')
  Test.assert_equals(calculate('1', '1', 'subtract'), '0')
  Test.assert_equals(calculate('1', '1', 'multiply'), '1')
  Test.assert_equals(calculate('10', '10', 'multiply'), '100')
  Test.assert_equals(calculate('100', '10', 'subtract'), '10')
end

Test.describe("Random tests") do
  def solculate(n1,n2,o) o=='add' ? (n1.to_i(2)+n2.to_i(2)).to_s(2) : o=='subtract' ? (n1.to_i(2)-n2.to_i(2)).to_s(2) : (n1.to_i(2)*n2.to_i(2)).to_s(2) end
  40.times do
   n1=rand(10000).to_s(2)
   n2=rand(10000).to_s(2)
   o=["add","subtract","multiply"][rand(3)]
    Test.it("Testing for calculate('"+n1+"', '"+n2+"', '"+o+"')") do
     Test.assert_equals(calculate(n1,n2,o),solculate(n1,n2,o),"It should work on random inputs too")
    end
  end
end
