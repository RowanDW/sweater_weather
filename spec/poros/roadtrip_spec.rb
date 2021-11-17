require 'rails_helper'

RSpec.describe 'Hourly Weather object' do
    it 'exists and has attributes' do
        roadtrip = Roadtrip.new("Denver,CO", "Pueblo,CO", 12345, {temperature: 32, conditions: "Something"})

        expect(roadtrip).to be_a(Roadtrip)
        expect(roadtrip.start_city).to eq("Denver,CO")
        expect(roadtrip.end_city).to eq("Pueblo,CO")
        expect(roadtrip.travel_time).to eq(12345)
        expect(roadtrip.destination_temp).to eq(32)
        expect(roadtrip.destination_conditions).to eq("Something")
    end
end