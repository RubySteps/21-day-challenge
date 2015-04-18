require 'open-uri'
require 'nokogiri'

class DictionaryEntry

  def initialize word
    @word = word
    lookup_in_dictionary
  end

  def output
    "#{@word}
#{print_array_elements_per_line @definitions}

Examples:

#{print_array_elements_per_line @examples}

Source: Cambridge Dictionaries Online / British English
#{@page_path}
"
  end


  def formatted_examples
    @examples.join "\n"
  end

  private
  def lookup_in_dictionary
    @page_path = File.join("http://dictionary.cambridge.org/dictionary/british", @word)
    page = Nokogiri::HTML(open(@page_path))
    @definitions = page.css("span[class='def']").collect{|def_tag|
        def_tag.text.strip
    }
    #TODO: separate the examples of the different definitions
    @examples = page.css("span[title='Example']").collect{|example_tag|
      example_tag.text
    }
  end

  #TODO: move to another class <= it isn't specific for dictionary entries
  def print_array_elements_per_line array
    array.join "\n"
  end

  
end
