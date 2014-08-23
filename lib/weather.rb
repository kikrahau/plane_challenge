module Weather

	def conditions
		Array.new.concat(sunny_days).concat(storming_days).sample
	end

	def sunny_days
		sun = []
		80.times {sun  << :sunny}
		sun
	end

	def storming_days
		storm = []
		20.times {storm << :storming}
		storm
	end
	
end