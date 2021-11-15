class Api::V1::CityWeatherController < ApplicationController

    def forecast
        city = MapquestFacade.get_coordinates(params[:location])
        forecast = OpenweatherService.get_city_weather(city[:lat], city[:lng])
        render json: ForecastSerializer.forecast(forecast)
    end

    def backgrounds
        image = UnsplashService.get_city_image(params[:location])
        render json: ImageSerializer.image(image[:results].first, params[:location])
    end
end