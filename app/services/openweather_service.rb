class OpenweatherService
    class << self
      def get_city_weather(lat, lon)
        response = Faraday.get("https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely,alerts&appid=#{ENV['openweather_key']}&units=imperial")
        parse_json(response)
      end
  
      private
  
      def parse_json(response)
        JSON.parse(response.body, symbolize_names: true)
      end
    end
  end