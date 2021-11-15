require 'rails_helper'

RSpec.describe 'Bored facade' do
    it '#get_activities_forecast', :vcr do
        activities = BoredFacade.get_activities_forecast(53.8)

        expect(activities).to be_a(Array)
        expect(activities.first).to be_a(Hash)
        expect(activities.first[:type]).to eq('busywork')
        expect(activities.second).to be_a(Hash)
        expect(activities.second[:type]).to eq('relaxation')

    end    
end