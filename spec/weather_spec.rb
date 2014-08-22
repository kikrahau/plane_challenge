require 'weather'


shared_examples "weather" do

	let(:weather) { described_class.new }

	it "knows the status of the weather" do
		expect([:sunny,:storming]).to include weather.conditions 
	end

	it "it should become stormy" do
		allow(weather).to receive(:conditions).and_return(:storming)
		expect(weather).to be_storming
	end
end

