#!/usr/bin/env ruby
require_relative 'dictionary_entry.rb'

def main
  if ARGV.size == 0
    puts "Please provide a word.\nThe script will search for it in the Cambridge British English Dictionary"
    exit
  end
  dict_entry = DictionaryEntry.new ARGV[0]

  puts dict_entry.output
end

main
