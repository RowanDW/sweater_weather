class Roadtrip
    attr_reader :start_city, :end_city, :travel_time, :destination_temp, :destination_conditions
    def initialize(origin, destination, trip_time, dest_weather)
        @start_city = origin
        @end_city = destination
        @travel_time = trip_time
        @destination_temp = dest_weather[:temperature]
        @destination_conditions = dest_weather[:conditions]
    end
end