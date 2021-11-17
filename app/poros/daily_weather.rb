class DailyWeather

    attr_reader :date, :sunrise, :sunset, :min_temp, :max_temp, :conditions, :icon
    def initialize(day_data)
        @date = day_data[:dt]
        @sunrise = day_data[:sunrise]
        @sunset = day_data[:sunset]
        @min_temp = day_data[:temp][:min]
        @max_temp = day_data[:temp][:max]
        @conditions = day_data[:weather].first[:description]
        @icon = day_data[:weather].first[:icon]
    end
end