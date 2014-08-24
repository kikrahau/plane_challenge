module Weather

	def conditions
		Array.new.concat(sunny_days).concat(storming_days).sample
	end

	def sunny_days
		sun = []
		90.times {sun  << :sunny}
		sun
	end

	def storming_days
		storm = []
		10.times {storm << :storming}
		storm
	end

end