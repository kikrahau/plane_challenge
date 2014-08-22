require 'weather'


shared_examples "weather" do

	let(:weather) { described_class.new }

	it "knows the status of the weather" do
		puts weather.conditions.inspect
		expect([:sunny,:storming]).to include weather.conditions 
	end

	it ''
end

