require 'airport'
require 'weather_spec'

describe Airport do

	let(:airport_DUS) 	{ Airport.new }	
	let(:lh_plane) { double :plane }
	let(:weather) { double :weather}

	context 'taking off and landing on sunny days' do
		before { allow(airport_DUS).to receive(:conditions).and_return(:sunny) }
		it "should be able to park planes" do
			expect(airport_DUS.planes).to eq []
		end

		it "should be able to let planes land" do
			airport_DUS.land lh_plane
			expect(airport_DUS.planes).to eq [lh_plane]
		end

		it "should be able to let planes take off" do			airport_DUS.take_off (lh_plane)
			expect(airport_DUS.planes).to eq []
		end

		it "should not allow a plane to land if the airport is full" do
			airport_DUS.capacity.times {airport_DUS.land(lh_plane)}
			expect(airport_DUS).to be_full
		end
	end

	context 'on storming days' do

		before {allow(airport_DUS).to receive(:conditions).and_return(:storming)}

		it "should raise error if a plane tries to land and a storm is brewing" do
			expect{(airport_DUS.land lh_plane)}. to raise_error("Can't land, storm is brewing!")
		end
		it "should raise error if a plane tries to take-off and it is storming" do
			expect{(airport_DUS.take_off lh_plane)}. to raise_error("Can't take-off, storm is brewing!")
		end


	end

end

# it "works" do
#     object = Object.new
#     object.stub(:foo) do |arg|
#       if arg == :this
#         "got this"
#       elsif arg == :that
#         "got that"
#       end
#     end
    
#     object.foo(:this).should eq("got this")
#     object.foo(:that).should eq("got that")
#   end