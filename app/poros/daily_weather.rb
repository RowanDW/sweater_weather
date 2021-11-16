class DailyWeather

    attr_reader :date, :sunrise, :sunset, :min_temp, :max_temp, :conditions, :icon
    def initialize(day_data)
        @date = Time.at(day_data[:dt]).to_date
        @sunrise = Time.at(day_data[:sunrise]).to_datetime
        @sunset = Time.at(day_data[:sunset]).to_datetime
        @min_temp = day_data[:temp][:min]
        @max_temp = day_data[:temp][:max]
        @conditions = day_data[:weather].first[:description]
        @icon = day_data[:weather].first[:icon]
    end
end