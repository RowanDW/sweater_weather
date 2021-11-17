class Roadtrip
    attr_reader :start_city, :end_city, :travel_time, :destination_weather
    def initialize(origin, destination, trip_time, dest_weather)
        @start_city = origin
        @end_city = destination
        @travel_time = trip_time
        @destination_weather = dest_weather
    end
end