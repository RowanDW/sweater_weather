require 'rails_helper'

RSpec.describe 'Openweather facade' do
    it '#get_activity_forecast', :vcr do
        forecast = OpenweatherFacade.get_activity_forecast("Denver,CO")

        expect(forecast).to be_a(Hash)
        expect(forecast).to have_key(:summary)
        expect(forecast).to have_key(:temperature)
        expect(forecast[:summary]).to be_a(String)
        expect(forecast[:temperature]).to be_a(Float)
    end    
end