require 'weather'


describe Weather do

	let(:airport) { Airport.new }

	it "knows the status of the weather" do
		expect([:sunny,:storming]).to include airport.conditions 
	end

	it "should be possible to storm" do
		allow(airport).to receive(:conditions).and_return(:storming)
		expect(airport).to be_storming
	end

	it "can only be sunny or storming" do
		weather_a =[]
		100.times {weather_a << airport.conditions}
		expect(weather_a.uniq.length).to eq 2
	end

	it "has an 80% chance of being sunny and a 20% chance of storming" do
		expect(airport.sunny_days.length). to eq 80
		expect(airport.storming_days.length). to eq 20
	end
end

