require 'hello'




describe Hello do
  it "should say 'Hello World'" do
    expect { Hello.world }.to match_stdout( 'Hello world' )
  end

  it "should return nil" do
    expect(Hello.world).to be_nil
  end
end
