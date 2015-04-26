class Fibonacci
	
	def initialize()
		@cache = {}	
	end
	
	def get(n)
		if n == 0 || n == 1
			return n
		else
			return get(n-2) + get(n-1)
		end
	end

	def get_optimized(n)
		if @cache.has_key?(n)
			return @cache[n]
		else
			if n == 0 || n == 1
				@cache[n] = n
				return n
			else
				val = get_optimized(n-1) + get_optimized(n-2)
				@cache[n] = val
				return val
			end
		end
	end
end