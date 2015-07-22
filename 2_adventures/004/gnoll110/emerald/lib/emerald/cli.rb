require 'thor'
require 'emerald'

module Emerald
  class CLI < Thor
    attr_accessor :app 

    default_task :emerald
    method_option :file, aliases: ['-f'],
                  desc: "name of the file containing instructions",
                  banner: 'FILE'

    desc "execute commands", "takes actions as per commands"
    def emerald
      @app = Emerald::Application.new
      if options[:file]
        process_file(options[:file])
      else
        puts "x"
        process_stdin
        puts "y"
      end
    end

    no_tasks do
      def process_file(filename)
        begin
          longfilename = File.join(File.dirname(__FILE__), "../..", filename)
          File.readlines(longfilename).map do |line|
            @app.process(line.strip.chomp)
          end
        rescue
          puts "Filename does not exist."
        end
      end

      def process_stdin
        while line = ask('') do
          if line.upcase == "EXIT"
            break
          end
          @app.process(line.strip.chomp)
        end
      end
    end 
  end
end