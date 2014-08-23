require 'plane'

describe Plane do

	let(:plane) { Plane.new }

	it "should be flying when created" do
 		expect(plane.flying_status).to be :flying
 	end

 	it "should have a landed status after landing" do
 		expect(plane.land!.flying_status).to eq :landed
 	end

 	 it "should be able to take off" do
 		expect(plane.take_off!.flying_status).to eq :flying
 	end

 	it "should have a flying status when in the air" do
 		expect(plane.take_off!.flying_status).to eq :flying
 	end
 	
end