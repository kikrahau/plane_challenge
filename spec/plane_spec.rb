require 'plane'

describe Plane do

	let(:plane) { Plane.new }

	it "should not be flying when created" do
 		expect(plane.flying_status).to be :landed
 	end

 	it "should have a landed status when not flying" do
 		expect(plane.flying_status).to eq :landed
 	end

 	 it "should be able to take off" do
 		expect(plane.take_off!.flying_status).to eq :flying
 	end

 	it "should have a flying status when in the air" do
 		expect(plane.take_off!.flying_status).to eq :flying
 	end
end