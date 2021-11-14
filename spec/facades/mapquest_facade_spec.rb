require 'rails_helper'

RSpec.describe 'Mapquest facade' do
    it '#get_coordinates', :vcr do
        coordinates = MapquestFacade.get_coordinates("Denver,CO")

        expect(coordinates).to be_a(Hash)
        expect(coordinates).to have_key(:lat)
        expect(coordinates).to have_key(:lng)
        expect(coordinates[:lat]).to eq(39.738453)
        expect(coordinates[:lng]).to eq(-104.984853)
    end    
end