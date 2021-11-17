require 'rails_helper'

RSpec.describe 'The roadtrip endpoint' do
    before :each do
        user_request = {
            "email": "whatever@example.com",
            "password": "password",
            "password_confirmation": "password"
        }
        post("/api/v1/users", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: user_request.to_json)
        @api_key = User.last.api_key
        
    end

    it 'can return trip and weather details', :vcr do
        trip_request = {
            "origin": "Denver,CO",
            "destination": "Pueblo,CO",
            "api_key": @api_key
          }
        
        post("/api/v1/road_trip", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: trip_request.to_json)
        expect(response).to be_successful

        trip_response = JSON.parse(response.body, symbolize_names: true)

        expect(trip_response).to be_a(Hash)
        expect(trip_response[:data]).to be_a(Hash)
        expect(trip_response[:data][:id]).to eq(nil)
        expect(trip_response[:data][:type]).to eq("roadtrip")
        expect(trip_response[:data][:attributes]).to be_a(Hash)
        expect(trip_response[:data][:attributes][:start_city]).to eq(trip_request[:origin])
        expect(trip_response[:data][:attributes][:end_city]).to eq(trip_request[:destination])
        expect(trip_response[:data][:attributes][:travel_time]).to be_a(String)
        expect(trip_response[:data][:attributes][:weather_at_eta]).to be_a(Hash)
        expect(trip_response[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
        expect(trip_response[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end

    it 'can return trip and weather details for longer trips', :vcr do
        trip_request = {
            "origin": "Denver,CO",
            "destination": "Boston,MA",
            "api_key": @api_key
          }
        
        post("/api/v1/road_trip", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: trip_request.to_json)
        expect(response).to be_successful
    end

    it 'returns trip details but no weather for trips more than 5 days', :vcr do
        
        trip_request = {
            "origin": "Prudhoe Bay,AK",
            "destination": "Panama City,Panama",
            "api_key": @api_key
          }
        
        post("/api/v1/road_trip", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: trip_request.to_json)
        expect(response).to be_successful

        trip_response = JSON.parse(response.body, symbolize_names: true)

        expect(trip_response[:data][:attributes][:weather_at_eta][:temperature]).to eq("Unknown")
    end

    it 'returns blank fields if given impossible trip', :vcr do
        trip_request = {
            "origin": "Denver,CO",
            "destination": "London,UK",
            "api_key": @api_key
          }
        
        post("/api/v1/road_trip", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: trip_request.to_json)
        expect(response).to be_successful


        trip_response = JSON.parse(response.body, symbolize_names: true)

        expect(trip_response[:data][:attributes]).to be_a(Hash)
        expect(trip_response[:data][:attributes][:start_city]).to eq(trip_request[:origin])
        expect(trip_response[:data][:attributes][:end_city]).to eq(trip_request[:destination])
        expect(trip_response[:data][:attributes][:travel_time]).to eq("Impossible")
        expect(trip_response[:data][:attributes][:weather_at_eta]).to be_a(Hash)
        expect(trip_response[:data][:attributes][:weather_at_eta][:temperature]).to eq(nil)
        expect(trip_response[:data][:attributes][:weather_at_eta][:conditions]).to eq(nil)
    end

    it 'returns an error given bad api key' do
        trip_request = {
            "origin": "Denver,CO",
            "destination": "London,UK",
            "api_key": 123
          }
        
        post("/api/v1/road_trip", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: trip_request.to_json)
        expect(response).to have_http_status(401)

        trip_request = {
            "origin": "Denver,CO",
            "destination": "London,UK"
          }
        
        post("/api/v1/road_trip", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: trip_request.to_json)
        expect(response).to have_http_status(401)
    end
end