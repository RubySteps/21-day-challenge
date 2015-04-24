module StoreCredit

	def StoreCredit.solveit(credit, items)
		items_hash = {}
		items.each_with_index do |item, index|
			if items_hash.has_key?(credit - item)
				return [index + 1, items.find_index(credit - item) + 1].sort
			else
				items_hash[item] = credit - item
			end
		end
	end

end