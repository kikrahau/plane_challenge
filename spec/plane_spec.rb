require 'plane'

describe Plane do

	let(:plane) { Plane.new }

	it "should not be flying when created" do
 		expect(plane).not_to be_flying
 	end

 	it "should be able to take off" do
 		expect(plane.take_off).to be_flying
 	end
end