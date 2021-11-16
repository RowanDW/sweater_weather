class OpenweatherFacade 
    def self.get_city_weather(location)
        city = MapquestFacade.get_coordinates(location)
        forecast = OpenweatherService.get_city_weather(city[:lat], city[:lng])
        Forecast.new(forecast)
    end
end