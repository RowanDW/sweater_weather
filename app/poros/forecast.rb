class Forecast

    attr_reader :datetime, :temperature, :sunrise, :sunset, :feels_like, 
                :humidity, :uvi, :visibility, :conditions, :icon,
                :daily, :hourly
    def initialize(weather_data)
       #binding.pry
        @datetime = Time.at(weather_data[:current][:dt]).to_datetime
        @temperature = weather_data[:current][:temp]
        @sunrise = Time.at(weather_data[:current][:sunrise]).to_datetime
        @sunset = Time.at(weather_data[:current][:sunset]).to_datetime
        @feels_like = weather_data[:current][:feels_like]
        @humidity = weather_data[:current][:humidity]
        @uvi = weather_data[:current][:uvi]
        @visibility = weather_data[:current][:visibility]
        @conditions = weather_data[:current][:weather].first[:description]
        @icon = weather_data[:current][:weather].first[:icon]
        @daily = create_dailies(weather_data[:daily])
        @hourly = create_hourlies(weather_data[:hourly])
    end

    def create_dailies(daily_data)
        daily_data.map do |day|
            DailyWeather.new(day)
        end.take(5)
    end

    def create_hourlies(hourly_data)
        hourly_data.map do |hour|
            HourlyWeather.new(hour)
        end.take(8)
    end
end