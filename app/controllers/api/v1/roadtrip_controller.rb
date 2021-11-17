class Api::V1::RoadtripController < ApplicationController
    def create
        trip_request = JSON.parse(request.raw_post, symbolize_names: true)
        if trip_request[:api_key] && User.valid_api?(trip_request[:api_key])
            roadtrip = MapquestFacade.get_trip_data(trip_request[:origin], trip_request[:destination])
            render json: RoadtripSerializer.trip(roadtrip), status: 200
        else
            render json: {"error": "Unauthorized request"}, status: 401
        end
    end
end