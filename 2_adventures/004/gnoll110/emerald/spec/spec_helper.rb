require 'rspec'
Dir[File.dirname(__FILE__) + '/support/*.rb'].each {|file| require file }

$0 = "emerald"
ARGV.clear

def capture(stream)
  puts "in capture"
  puts stream.to_s
  begin
    stream = stream.to_s
    eval "$#{stream} = StringIO.new"
    puts "z"
    yield
    puts "zz"
    result = eval("$#{stream}").string
  ensure
    eval("$#{stream} = #{stream.upcase}")
  end
  result
end