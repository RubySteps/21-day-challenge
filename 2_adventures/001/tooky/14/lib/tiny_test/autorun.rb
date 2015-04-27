require 'tiny_test'

at_exit do
  result = TinyTest::Result.new

  TinyTest.run_all(TinyTest::Suite.stack, result)

  if result.failures.any?
    puts "Tests Failed:"
    puts

    result.failures.each do |f|
      puts "  #{f.exception.class} - #{f.exception.message}"
      puts f.exception.backtrace.map { |s| "    #{s}" }
      puts
    end
  end

  puts "#{result.run_count} ran, #{result.passed_count} passed, #{result.failed_count} failed"

  puts "Success!" if result.run_count == result.passed_count
end
