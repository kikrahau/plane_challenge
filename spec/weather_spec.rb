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
	
end

