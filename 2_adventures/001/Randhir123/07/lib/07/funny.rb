class Funny
	def funny?(input)
		rev = input.reverse
		for i in 1..input.length - 1
			if (input[i].ord - input[i-1].ord).abs != (rev[i].ord - rev[i-1].ord).abs
				return false
			end
		end
		return true
	end
end