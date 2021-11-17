class HourlyWeather

    attr_reader :time, :temp, :conditions, :icon
    def initialize(hour_data)
        @time = hour_data[:dt]
        @temp = hour_data[:temp]
        @conditions = hour_data[:weather].first[:description]
        @icon = hour_data[:weather].first[:icon]
    end
end