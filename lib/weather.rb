module Weather

	def conditions
		possibilities = [:sunny,:storming]
		possibilities[rand(possibilities.length)]
	end

	def storming?
		conditions == :storming
	end
end