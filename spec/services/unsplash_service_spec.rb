require 'rails_helper'

RSpec.describe 'unsplash service', :vcr do
  it 'finds image forcast info based on query' do
    response = UnsplashService.get_city_image("Denver,CO")

    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(response[:results]).to be_a(Array)

    photo = response[:results].first
    expect(photo).to have_key(:urls)
    expect(photo[:urls]).to be_a(Hash)
    expect(photo[:urls]).to have_key(:regular)
    expect(photo[:urls][:regular]).to be_a(String)
    expect(photo).to have_key(:user)
    expect(photo[:user]).to be_a(Hash)
    expect(photo[:user]).to have_key(:name)
    expect(photo[:user][:name]).to be_a(String)
  end
end