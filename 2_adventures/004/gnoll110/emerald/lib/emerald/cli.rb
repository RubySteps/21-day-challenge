require 'thor'
require 'emerald'

module Emerald
  class CLI < Thor
    #attr_accessor :app 

    default_task :emerald
    method_option :file, aliases: ['-f'],
                  desc: "name of the file containing instructions",
                  banner: 'FILE'

    desc "execute commands", "takes actions as per commands"
    def emerald
    end
  end
end