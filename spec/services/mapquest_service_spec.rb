require 'rails_helper'

RSpec.describe 'mapquest service', :vcr do
  it 'finds city info based on city name search' do
    response = MapquestService.get_city_data("Denver,CO")

    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(response[:results]).to be_an(Array)
    expect(response[:results].first).to be_a Hash
   
    expect(response[:results].first).to have_key(:locations)
    expect(response[:results].first[:locations]).to be_an(Array)

    first = response[:results].first[:locations].first

    expect(first).to be_a(Hash)
    expect(first).to have_key(:latLng)

    expect(first[:latLng]).to be_a(Hash)
    expect(first[:latLng]).to have_key(:lat)
    expect(first[:latLng]).to have_key(:lng)
    expect(first[:latLng][:lat]).to be_a(Float)
    expect(first[:latLng][:lng]).to be_a(Float)
  end
end
