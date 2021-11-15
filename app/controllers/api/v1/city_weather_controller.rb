class Api::V1::CityWeatherController < ApplicationController

    def forecast
        if params[:location].present?
            city = MapquestFacade.get_coordinates(params[:location])
            forecast = OpenweatherService.get_city_weather(city[:lat], city[:lng])
            render json: ForecastSerializer.forecast(forecast)
        else
            render json: {error: "No location given"}, status: 400
        end
    end

    def backgrounds
        if params[:location].present?
            image = UnsplashService.get_city_image(params[:location])
            render json: ImageSerializer.image(image[:results].first, params[:location])
        else
            render json: {error: "No location given"}, status: 400
        end
    end

    def activities
        if params[:destination].present?
            city = MapquestFacade.get_coordinates(params[:destination])
            forecast = OpenweatherService.get_city_weather(city[:lat], city[:lng])
            activities = []
            activities << BoredService.get_activity(get_activity_type(forecast[:current][:temp]))
            activities << BoredService.get_activity('relaxation')
            render json: ActivitySerializer.activities(forecast, activities, params[:destination])
        else
            render json: {error: "No destination given"}, status: 400
        end
    end

    private

    def get_activity_type(temp)
        case temp
        when temp < 50
          "cooking"
        when temp >= 60
          "recreational"
        else
          "busywork"
        end
    end
end