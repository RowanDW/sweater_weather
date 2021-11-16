class UnsplashFacade
    def self.get_city_image(location)
        image = UnsplashService.get_city_image(location)
        Image.new(image[:results].first)
    end
end