require_relative "lexicon_type"

class Lexicon

	# Builds the lexicon hash from the data
	def initialize()
		@lexicon = {}
		@lexicon_inverted = {}
		@lexicon[LexiconType::DIRECTION] = Lexicon.get_tokens_from("data/lexicon/direction.txt")
		@lexicon[LexiconType::NOUN] = Lexicon.get_tokens_from("data/lexicon/noun.txt")
		@lexicon[LexiconType::STOP] = Lexicon.get_tokens_from("data/lexicon/stop.txt")
		@lexicon[LexiconType::VERB] = Lexicon.get_tokens_from("data/lexicon/verb.txt")
		invert_hash() # invert hash for better lookup
	end

	# Returns a list of [type, word] tuples using the lexicon
	def scan(user_input)
		tokens = []
		user_input.chomp.split.each do |word|
			begin
				tokens.push([LexiconType::NUMBER, Integer(word)])
			rescue
				if @lexicon_inverted.has_key? word
					tokens.push([@lexicon_inverted[word], word])
				else
					tokens.push([LexiconType::ERROR, word])
				end
			end
		end
		return tokens
	end

	# Reads a lexicon file and return a list of words
	def Lexicon.get_tokens_from(file_name)
		words = []
		f = File.open(file_name, "r")
		f.each_line do |line|
			if ! line.start_with? '#'
				words.push(line.chomp)
			end
		end
		f.close
		return words
	end

	# Inverts hash to speedup lookup
	def invert_hash()
		@lexicon.each do |k, v|
			v.each do |w|
				@lexicon_inverted[w] = k
			end
		end
	end
end