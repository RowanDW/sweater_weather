class MapquestFacade 
    def self.get_coordinates(location)
        city_data = MapquestService.get_city_data(location)
        latlng = city_data[:results].first[:locations].first[:latLng]
    end

    def self.get_trip_data(origin, destination)
        trip = MapquestService.get_trip_data(origin, destination)

        if trip[:route][:formattedTime].blank?
            trip_time = "Impossible"
            dest_weather = {temperature: nil, conditions: nil}
            Roadtrip.new(origin, destination, trip_time, dest_weather)
        else
            trip_time = trip[:route][:formattedTime].split(':').map(&:to_i).inject(0) { |a, b| a * 60 + b }
            dest_forecast = OpenweatherFacade.get_city_weather(destination)
            dest_weather = get_trip_weather(trip_time, dest_forecast)
            Roadtrip.new(origin, destination, Time.at(trip_time).utc.strftime("%H:%M:%S"), dest_weather)
        end
    end

    private

    def self.get_trip_weather(time, forecast)
        eta = forecast.datetime + time   
        if time < 28800 # 8 hours in seconds
            weather = forecast.hourly.find_all do |hour|
                eta > hour.time
            end.last
            {temperature: weather.temp, conditions: weather.conditions}
        elsif eta < (forecast.daily.last.date) + 86400 # end of the last day of daily forecast
            weather = forecast.daily.find_all do |day|
                eta > day.date
            end.last
            {temperature: weather.max_temp, conditions: weather.conditions}
        else
            {temperature: "Unknown", conditions: "Unknown - too far out to forecast"}
        end
    end
end