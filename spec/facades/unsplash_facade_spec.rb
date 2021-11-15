require 'rails_helper'

RSpec.describe 'Unsplash facade' do
    it '#get_city_image', :vcr do
        image = UnsplashFacade.get_city_image("Denver,CO")

        expect(image).to be_a(Image)
        expect(image.url).to be_a(String)
        expect(image.author).to be_a(String)
    end    
end