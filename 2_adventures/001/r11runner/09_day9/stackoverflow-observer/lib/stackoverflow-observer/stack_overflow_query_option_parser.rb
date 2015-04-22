require 'optparse'

module StackOverflowObserver::StackOverflowQueryOptionParser
  
  def self.retrieve_args
    options = {tags: 'ruby', hours: 48}

    parser = OptionParser.new do|opts|
      opts.banner = "Usage: query_stackoverflow.rb [options]"
      opts.on('-t', '--tags tags', "The tags whose quesions you're searching for. You can provide more tags separated by ; In this case only questions with all of these tags will be found. Default: ruby") do |tags|
        options[:tags] = tags
      end

      opts.on('-h', '--hours hours', Integer, 'Questions from the last x hours will be found. Default: 48') do |hours|
        options[:hours] = hours
      end

      opts.on('-h', '--help', 'Displays Help') do
        puts opts
        exit
      end
    end
    parser.parse!
    options
  end

end
