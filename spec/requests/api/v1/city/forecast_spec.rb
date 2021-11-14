require 'rails_helper'

RSpec.describe 'the city weather forecast endpoint' do  
    it 'returns the weather data for the given city' do
        get '/api/v1/forecast?location=denver,co'

        expect(response).to be successful

        weather = JSON.parse(response.body, symbolize_names: true)

        expect(weather).to be_a Hash
        expect(weather).to have_key 'data'
        expect(weather[:data]).to be_a Hash
    end
end