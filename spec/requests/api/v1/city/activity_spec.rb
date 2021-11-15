require 'rails_helper'

RSpec.describe 'the activity endpoint' do  
    it 'returns activities and weather for given city', :vcr do
        get '/api/v1/activities?destination=denver,co'

        expect(response).to be_successful

        activities = JSON.parse(response.body, symbolize_names: true)
    
        expect(activities).to be_a Hash
        expect(activities[:data]).to be_a Hash
        expect(activities[:data][:id]).to eq(nil)
        expect(activities[:data][:type]).to eq('activities')
        expect(activities[:data][:attributes]).to be_a(Hash)
        expect(activities[:data][:attributes][:destination]).to be_a('denver,co')
        expect(activities[:data][:attributes][:forecast]).to be_a(Hash)
        expect(activities[:data][:attributes][:forecast][:summary]).to be_a(String)
        expect(activities[:data][:attributes][:forecast][:temperature]).to be_a(String)

        expect(activities[:data][:activities]).to be_a(Array) 
        expect(activities[:data][:activities].count).to eq(2)
        first = activities[:data][:activities].first
        expect(first).to be_a(Hash)
        expect(first[:title]).to be_a(String)
        expect(first[:type]).to be_a(String)
        expect(first[:participants]).to be_a(Integer)
        expect(first[:price]).to be_a(Numeric)
    end

    it 'returns an error if no destination is given', :vcr do
        get '/api/v1/activities'
        expect(response).to_not be_successful
        error = JSON.parse(response.body, symbolize_names: true)
        expect(error).to eq({error: "No destination given"})

        get '/api/v1/activities?destination= '
        expect(response).to_not be_successful
        error = JSON.parse(response.body, symbolize_names: true)
        expect(error).to eq({error: "No destination given"})
    end
end