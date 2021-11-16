class Api::V1::CityWeatherController < ApplicationController

    def forecast
        if params[:location].present?
            city = MapquestFacade.get_coordinates(params[:location])
            forecast = OpenweatherService.get_city_weather(city[:lat], city[:lng])
            forecast_poro = Forecast.new(forecast)
           
            render json: ForecastSerializer.forecast(forecast_poro)
        else
            render json: {error: "No location given"}, status: 400
        end
    end

    def backgrounds
        if params[:location].present?
            image = UnsplashFacade.get_city_image(params[:location])
            render json: ImageSerializer.image(image, params[:location])
        else
            render json: {error: "No location given"}, status: 400
        end
    end
end