class Api::V1::CityWeatherController < ApplicationController

    def forecast
        if params[:location].present?
            forecast = OpenweatherFacade.get_city_weather(params[:location])
            render json: ForecastSerializer.forecast(forecast)
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