require 'rails_helper'

RSpec.describe 'Openweather facade' do
    it '#get_city_weather', :vcr do
        forecast = OpenweatherFacade.get_city_weather("Denver,CO")

        expect(forecast).to be_a(Forecast)
    end    
end