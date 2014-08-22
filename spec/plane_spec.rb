require 'plane'

describe Plane do

	let(:plane) { Plane.new }

	it "should not be flying when created" do
 		expect(plane).not_to be_flying
 	end

 	it "should have a landed status when not flying" do
 		expect(plane.status).to eq "landed"
 	end

 	 it "should be able to take off" do
 		expect(plane.take_off).to be_flying
 	end

 	it "should have a flying status when in the air" do
 		expect(plane.take_off.status).to eq "flying"
 	end
end