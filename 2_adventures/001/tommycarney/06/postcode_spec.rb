require 'rspec'
require_relative 'postcode'
$stdout = StringIO.new

describe Postcode do 
  before do 
	  @postcode_searcher = Postcode.new
	  @options = { :postcode => "SW1A 0AA" }
	  @postcode_searcher.enter_postcode(@options)
  end
  
  it "should have a postocde" do
  	@postcode_searcher.postcode.should eq("SW1A0AA")
  end
  
  it "should have postcode information" do
  	@postcode_searcher.postcode_info.should_not eq(nil)
  end

end