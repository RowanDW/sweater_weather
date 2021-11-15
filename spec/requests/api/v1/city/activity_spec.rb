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
        expect(activities[:data][:attributes][:destination]).to eq('denver,co')
        expect(activities[:data][:attributes][:forecast]).to be_a(Hash)
        expect(activities[:data][:attributes][:forecast][:summary]).to be_a(String)
        expect(activities[:data][:attributes][:forecast][:temperature]).to be_a(String)

        expect(activities[:data][:attributes][:activities]).to be_a(Array) 
        expect(activities[:data][:attributes][:activities].count).to eq(2)
        first = activities[:data][:attributes][:activities].first
        expect(first).to be_a(Hash)
        expect(first[:title]).to be_a(String)
        expect(first[:type]).to be_a(String)
        expect(first[:participants]).to be_a(Integer)
        expect(first[:price]).to be_a(Numeric)
    end

    it 'returns the correct activity type based on temperature', :vcr do
        allow(OpenweatherFacade).to receive(:get_activity_forecast).and_return({summary: "Should be recreational", temperature: 62.3})
        get '/api/v1/activities?destination=denver,co'
        activities = JSON.parse(response.body, symbolize_names: true)
        first = activities[:data][:attributes][:activities].first
        expect(first[:type]).to eq('recreational')
        second = activities[:data][:attributes][:activities].second
        expect(second[:type]).to eq('relaxation')

        allow(OpenweatherFacade).to receive(:get_activity_forecast).and_return({summary: "Should be busywork", temperature: 59.3})
        get '/api/v1/activities?destination=denver,co'
        activities = JSON.parse(response.body, symbolize_names: true)
        first = activities[:data][:attributes][:activities].first
        expect(first[:type]).to eq('busywork')
        second = activities[:data][:attributes][:activities].second
        expect(second[:type]).to eq('relaxation')

        allow(OpenweatherFacade).to receive(:get_activity_forecast).and_return({summary: "Should be cooking", temperature: 49.3})
        get '/api/v1/activities?destination=denver,co'
        activities = JSON.parse(response.body, symbolize_names: true)
        first = activities[:data][:attributes][:activities].first
        expect(first[:type]).to eq('cooking')
        second = activities[:data][:attributes][:activities].second
        expect(second[:type]).to eq('relaxation')
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