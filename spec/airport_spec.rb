require 'airport'


describe Airport do
	let(:airport_DUS) 	{ Airport.new }
	# let(:congested_DUS)	{ Airport.new }
	let(:lh_plane) { double :plane }

	it "should be able to park planes" do
		expect(airport_DUS.planes).to eq []
	end

	it "should be able to let planes land" do
		airport_DUS.land lh_plane
		expect(airport_DUS.planes).to eq [lh_plane]
	end

	it "should be able to let planes take off" do
		airport_DUS.land lh_plane
		airport_DUS.take_off (lh_plane)
		expect(airport_DUS.planes).to eq []
	end

	it "a plane cannot land if the airport is full" do
		airport_DUS.capacity.times {airport_DUS.land(lh_plane)}
		expect(airport_DUS).to be_full
	end

end