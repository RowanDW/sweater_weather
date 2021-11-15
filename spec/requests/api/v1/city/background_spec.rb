require 'rails_helper'

RSpec.describe 'the city weather forecast endpoint' do  
    it 'returns image data for given city', :vcr do
        get '/api/v1/backgrounds?location=denver,co'

        expect(response).to be_successful

        image = JSON.parse(response.body, symbolize_names: true)
    
        expect(image).to be_a Hash
        expect(image[:data]).to be_a Hash
        expect(image[:data][:id]).to eq(nil)
        expect(image[:data][:type]).to eq('image')
        expect(image[:data][:attributes]).to be_a(Hash)
        expect(image[:data][:attributes][:image]).to be_a(Hash)
        expect(image[:data][:attributes][:image][:location]).to eq('denver,co')
        expect(image[:data][:attributes][:image][:image_url]).to be_a(String)
        expect(image[:data][:attributes][:image][:credit]).to be_a(Hash) 
        expect(image[:data][:attributes][:image][:credit][:source]).to eq("unsplash.com")
        expect(image[:data][:attributes][:image][:credit][:author]).to be_a(String)
    end

    it 'returns an error if no location is given', :vcr do
        get '/api/v1/forecast'
        expect(response).to_not be_successful
        error = JSON.parse(response.body, symbolize_names: true)
        expect(error).to eq({error: "No location given"})

        get '/api/v1/forecast?location= '
        expect(response).to_not be_successful
        error = JSON.parse(response.body, symbolize_names: true)
        expect(error).to eq({error: "No location given"})
    end
end