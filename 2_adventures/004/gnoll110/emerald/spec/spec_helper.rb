require 'rspec'
Dir[File.dirname(__FILE__) + '/support/*.rb'].each {|file| require file }

$0 = "emerald"
ARGV.clear

def capture(stream)
  begin
    stream = stream.to_s
    eval "$#{stream} = StringIO.new"
    yield
    result = eval("$#{stream}").string
  ensure
    eval("$#{stream} = #{stream.upcase}")
  end
  result
end