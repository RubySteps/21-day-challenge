class Spelling
	
	def initialize()
		@mapping = {' ' => 0, 'abc' => 2, 'def' => 3, 'ghi' => 4, 'jkl' => 5, 'mno' => 6, 'pqrs' => 7, 'tuv' => 8, 'wxyz' => 9}

		@map = {}
		@mapping.each do |key, val|
			key.each_char.with_index(0) {|c, i| @map[c] = [val, i + 1]}
		end
	end

	def message(input)
		out = ""
		out << "#{@map[input[0]][0]}" * @map[input[0]][1]
		for i in (1..input.length - 1).step(1)
			if @map[input[i]][0] == @map[input[i-1]][0]
				out << " "
			end
			out << "#{@map[input[i]][0]}" * @map[input[i]][1]
		end
		return out
	end
end