	def next
		Question.limit(1).order("ID ASC").where("id > ?", id).first
	end
