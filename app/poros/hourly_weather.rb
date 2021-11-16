class HourlyWeather

    attr_reader :time, :temp, :conditions, :icon
    def initialize(hour_data)
        @time = Time.at(hour_data[:dt]).to_time.strftime('%T')
        @temp = hour_data[:temp]
        @conditions = hour_data[:weather].first[:description]
        @icon = hour_data[:weather].first[:icon]
    end
end