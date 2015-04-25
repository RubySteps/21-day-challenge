module MinimumScalarProduct
	def MinimumScalarProduct.solveit(x, y)
		x.sort!.zip(y.sort!{|a,b| b <=> a}).inject(0){|r, (a, b)| r + (a * b)}
	end 
end