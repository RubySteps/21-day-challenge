class Meaning

  def initialize definition, examples
    @definition = definition
    @examples = examples
  end

  def output
    "#{@definition}

Examples:

#{print_array_elements_per_line @examples}
"
  end

  private
  #TODO: move to another class <= it isn't specific for dictionary entries
  def print_array_elements_per_line array
    array.join "\n"
  end

  
end
