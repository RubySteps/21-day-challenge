module Dict
	def Dict.new(num_buckets=256)
		aDict = []
		(0...num_buckets).each do |i|
			aDict.push([])
		end
		return aDict
	end

	def Dict.hash_key(aDict, key)
		return key.hash % aDict.length
	end

	def Dict.get_bucket(aDict, key)
		bucket_id = Dict.hash_key(aDict, key)
		return aDict[bucket_id]
	end

	def Dict.get_slot(aDict, key, default=nil)
		bucket = Dict.get_bucket(aDict, key)

		bucket.each_with_index do |kv, i|
			k, v = kv
			if key == k
				return i, k, v
			end
		end
		return -1, key, default
	end

	def Dict.get(aDict, key, default=nil)
		i, k, v = Dict.get_slot(aDict, key, default=default)
		return v
	end

	def Dict.set(aDict, key, value)
		bucket = Dict.get_bucket(aDict, key)
		i, k, v = Dict.get_slot(aDict, key)

		if i >= 0
			bucket[i] = [key, value]
		else
			bucket.push([key, value])
		end
	end

	def Dict.delete(aDict, key)
		bucket = Dict.get_bucket(aDict, key)

		(0...bucket.length).each do |i|
			k, v = bucket[i]
			if key == k
				bucket.delete_at(i)
				break
			end
		end
	end

	def Dict.list(aDict)
		aDict.each do |bucket|
			if bucket
				bucket.each do |k, v|
					puts k, v
				end
			end
		end
	end
end