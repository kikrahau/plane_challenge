require './lib/weather'
require './lib/plane'

class Airport

	include Weather

	attr_accessor :planes, :capacity

	DEFAULT_CAPACITY = 6

	def initialize
		@planes = []
		@capacity = DEFAULT_CAPACITY
	end

	def allow_to_land plane
		raise "Get outta here, there's a f****** hurricane coming" if conditions == :storming
		raise "Oi mate! No space mate!" if full?
		plane.land!	
		@planes << plane	
	end

	def allow_to_take_off plane
		raise "Dude, now way you can take-off now, it's cats n' dogs out there!" if conditions == :storming
		plane.take_off!
		@planes.delete plane 
	end

	def full?
		@planes.length == capacity
	end

end