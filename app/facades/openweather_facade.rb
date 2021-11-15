class OpenweatherFacade 
    def self.get_activity_forecast(destination)
        city = MapquestFacade.get_coordinates(destination)
        forecast = OpenweatherService.get_city_weather(city[:lat], city[:lng])
        weather = { 
                    summary: forecast[:current][:weather].first[:description],
                    temperature: forecast[:current][:temp]
                }
    end
end