class Plane

	def initialize
		@flying = false
	end

	def flying?
		@flying
	end

	def take_off
		@flying = true
		self
	end

	def status
		return "flying" if @flying == true
		return "landed" if @flying == false
	end
end 