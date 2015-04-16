class Chop

	def self.chop(search, array)
		self.binary_search(search, array, 0, array.length - 1)
	end


	private

	def self.binary_search(search, array, bottom, top)
		return -1 if top < bottom

		middle = (bottom + top) / 2

		if array[middle] > search
			self.binary_search(search, array, bottom, middle - 1)
		elsif array[middle] < search
			self.binary_search(search, array, middle + 1, top)
		else
			return middle
		end
	end
end