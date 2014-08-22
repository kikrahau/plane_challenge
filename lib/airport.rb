require 'weather'
class Airport
	include Weather

	attr_accessor :planes

	DEFAULT_CAPACITY = 5

	def initialize
		@planes = []
		@capacity
	end

	def capacity
		@capacity = DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def land plane
		@planes << plane unless full?	
	end

	def take_off plane
		@planes.delete plane 
	end

	def full?
		@planes.length == capacity
	end
end