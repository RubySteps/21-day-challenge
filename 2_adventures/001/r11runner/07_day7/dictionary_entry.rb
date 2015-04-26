require 'open-uri'
require 'nokogiri'
require_relative 'meaning.rb'

class DictionaryEntry

  def initialize word
    @word = word
    lookup_in_dictionary
  end

  def output
    "#{@word}
#{formatted_meanings}
Source: Cambridge Dictionaries Online / British English
#{@page_path}
"
  end

  def formatted_meanings
    outputs = @meanings.collect{|m|
      m.output
    }
    outputs.join "\n"
  end

  private
  def lookup_in_dictionary
    @meanings = []
    @page_path = File.join("http://dictionary.cambridge.org/dictionary/british", @word)
    page = Nokogiri::HTML(open(@page_path))
    page.css("div[class='sense-block']").css("span[class='def-block']").each{|def_block|
      definition = def_block.css("span[class='def']").text.strip    
      examples = def_block.css("span[title='Example']").collect{|example_tag|
        example_tag.text
      }
      @meanings << Meaning.new(definition, examples)
    }
  end
  
end
