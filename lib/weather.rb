module Weather

	def conditions
		weather_outcome = rand(9)
		weather_outcome >= 2 ? :sunny : :storming
	end
	
end