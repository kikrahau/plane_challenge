class Plane

	attr_accessor :flying_status

	def initialize
		@flying_status = :flying
	end

	def take_off!
		@flying_status
		self
	end

	def land!
		@flying_status = :landed
		self
	end

end 