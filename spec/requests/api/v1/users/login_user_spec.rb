require 'rails_helper'

RSpec.describe 'The user login endpoint' do
    before :each do
        user_request = {
            "email": "whatever@example.com",
            "password": "password",
            "password_confirmation": "password"
        }
        post("/api/v1/users", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: user_request.to_json)
    end

    it 'can login a user' do
        user_request = {
            "email": "whatever@example.com",
            "password": "password"
        }
        post("/api/v1/sessions", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: user_request.to_json)
        
        expect(response).to be_successful

        user_response = JSON.parse(response.body, symbolize_names: true)
        created_user = User.last

        expect(user_response).to be_a(Hash)
        expect(user_response[:data]).to be_a(Hash)
        expect(user_response[:data][:id]).to eq(created_user.id)
        expect(user_response[:data][:type]).to eq("user")
        expect(user_response[:data][:attributes][:email]).to eq("whatever@example.com")
        expect(user_response[:data][:attributes][:api_key]).to eq(created_user.api_key)
    end

    it 'throws an error given bad user data' do
        user_request = {
            "email": "whatever@example.com",
            "password": "password2"
        }
        post("/api/v1/sessions", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: user_request.to_json)
        expect(response).to_not be_successful

        user_request = {
            "password": "password"
        }
        post("/api/v1/sessions", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: user_request.to_json)
        expect(response).to_not be_successful

        user_request = {
            "email": "test@example.com",
            "password": "password"
        }
        post("/api/v1/sessions", headers: {"Content_Type": "application/json", "Accept": "application/json"}, params: user_request.to_json)
        expect(response).to_not be_successful
    end
end