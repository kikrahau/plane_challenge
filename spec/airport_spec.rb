require 'airport'
require 'plane'
require 'weather_spec'

describe Airport do

	let(:airport_DUS) 	{ Airport.new }	
	let(:lh_plane) 		{ double :plane }
	let(:weather) 		{ double :weather}

	context 'taking off and landing on sunny days' do
		#set weather conditions to sunny so airport and planes can operate properly 
		before { allow(airport_DUS).to receive(:conditions).and_return(:sunny) }

		it "should have have no planes" do
			expect(airport_DUS.planes).to be_empty
		end

		it "should be able to let planes land" do
			allow(lh_plane).to receive(:land!).and_return(:landed)
			airport_DUS.allow_to_land lh_plane
			expect(airport_DUS.planes).to eq [lh_plane]
		end

		it "it should a plane when landing" do 
			expect(lh_plane).to receive(:land!).and_return(:landed)
			airport_DUS.allow_to_land lh_plane
		end

		it "should be able to let planes take off" do
			allow(lh_plane).to receive(:take_off!).and_return(:flying)
			airport_DUS.allow_to_take_off (lh_plane)
			expect(airport_DUS.planes).to eq []
		end

		it "should not allow a plane to land if the airport is full" do
			allow(lh_plane).to receive(:land!).and_return(:landed)
			airport_DUS.capacity.times {airport_DUS.allow_to_land(lh_plane)}
			expect{airport_DUS.allow_to_land(plane)}.to raise_error
		end

	end

	context 'on storming days' do

		#set conditions to storming 
		before {allow(airport_DUS).to receive(:conditions).and_return(:storming)}

		it "should raise error if a plane tries to land and a storm is brewing" do
			expect{(airport_DUS.allow_to_land lh_plane)}. to raise_error
		end

		it "should raise error if a plane tries to take-off and it is storming" do
			expect{(airport_DUS.allow_to_take_off lh_plane)}. to raise_error
		end

	end

end

describe "The grand finale (last spec)" do

  	let(:lh_plane) 		{ Plane.new }
  	let(:airport_DUS) 	{ Airport.new }


	# create some sunny weather for the Lufthansa fleet
  	before {allow(airport_DUS).to receive(:conditions).and_return(:sunny)}
  	
  it 'all planes can land and all planes can take off' do
  	#create a Lufthansa fleet in the size of the capacity of the Dusseldorf Airport
 	lufthansa_fleet = []
	airport_DUS.capacity.times { lufthansa_fleet << lh_plane }

	#land each plane and check the landed status
  	lufthansa_fleet.each { |lh_plane| airport_DUS.allow_to_land(lh_plane) }
  	lufthansa_fleet.each { |lh_plane| expect(lh_plane.flying_status).to eq :landed }
  	#let each plane take off and check the flying status
  	lufthansa_fleet.each { |lh_plane| airport_DUS.allow_to_take_off(lh_plane) }
  	lufthansa_fleet.each { |lh_plane| expect(lh_plane.flying_status).to eq :flying }
  	end

end