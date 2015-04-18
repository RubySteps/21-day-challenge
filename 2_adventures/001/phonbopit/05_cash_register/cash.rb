class Cash

	attr_reader :coins

	def initialize
		@coins = [1000, 500, 100, 50, 20, 10, 5, 2, 1]
	end

	def get_change total_payable, cash_paid

		change = []
		remaining = cash_paid - total_payable

		puts "\nTotal Change : #{remaining}"

		for i in 0..@coins.size - 1
			coin = @coins[i]

			if remaining / coin >= 1
				times = remaining / coin

				puts "Coin : #{coin} x #{times}"

				for j in 1..times
					change << coin
					remaining = remaining - coin
				end
			end
		end

		puts "#{change}"
		puts "-" * 10

		change
	end

end