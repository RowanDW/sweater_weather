require 'rails_helper'

RSpec.describe 'the bored api service' do
    it 'returns an activity', :vcr do
        response = BoredService.get_activity("relaxation")
        expect(response).to be_a(Hash)
        expect(response).to have_key(:activity)
        expect(response[:activity]).to be_a(String)
        expect(response).to have_key(:accessibility)
        expect(response[:accessibility]).to be_a(Numeric)
        expect(response).to have_key(:type)
        expect(response[:type]).to eq('relaxation')
        expect(response).to have_key(:participants)
        expect(response[:participants]).to be_a(Integer)
        expect(response).to have_key(:price)
        expect(response[:price]).to be_a(Numeric)
        expect(response).to have_key(:link)
        expect(response[:link]).to be_a(String)
        expect(response).to have_key(:key)
        expect(response[:key]).to be_a(String)
    end
end