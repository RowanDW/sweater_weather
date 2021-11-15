class UnsplashService
    class << self
        def get_city_image(query)
          response = Faraday.get("https://api.unsplash.com/search/photos?query=#{query}&client_id=#{ENV['unsplash_access_key']}")
          parse_json(response)
        end
    
        private
    
        def parse_json(response)
          JSON.parse(response.body, symbolize_names: true)
        end
      end
end