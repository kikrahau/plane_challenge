require './lib/weather'

class Airport

	include Weather

	attr_accessor :planes, :capacity

	DEFAULT_CAPACITY = 10

	def initialize
		@planes = []
		@capacity = DEFAULT_CAPACITY
	end

	def allow_to_land plane
		raise "Can't land, storm is brewing!" if conditions == :storming
		plane.land!
		@planes << plane unless full?	
	end

	def allow_to_take_off plane
		raise "Can't take-off, storm is brewing!" if conditions == :storming
		plane.take_off!
		@planes.delete plane 
	end

	def full?
		@planes.length == capacity
	end

end