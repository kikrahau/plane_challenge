class Plane

	attr_accessor :flying_status

	def initialize
		@flying_status = :landed
	end

	def flying?
		@flying_status
	end

	def take_off!
		@flying_status = :flying
		self
	end
end 