	def next
		Survey.limit(1).order("id ASC").where("id > ?", id).first
	end
