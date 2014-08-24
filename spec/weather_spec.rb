require 'weather'


describe Weather do

	let(:airport) { Airport.new }

	it "knows the status of the weather" do
		expect([:sunny,:storming]).to include airport.conditions 
	end

	it "can only be sunny or storming" do
		weather_a = []
		100.times {weather_a << airport.conditions}
		expect(weather_a.uniq.length).to eq 2
	end

	it "has a 90% chance of being sunny and a 10% chance of storming" do
		expect(airport.sunny_days.length). to eq 90 #percent chance
		expect(airport.storming_days.length). to eq 10 #percent chance
	end

end

