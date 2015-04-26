class Question

  attr_reader :sentence

  def initialize(arg_hash)
    @sentence = arg_hash[:sentence]
  end

end
