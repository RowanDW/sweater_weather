class ForecastSerializer

    def self.forecast(forecast)
        {
            "data": {
                "id": nil,
                "type": "forecast",
                "attributes": {
                    "current_weather": {
                        "datetime": Time.at(forecast.datetime).to_datetime,
                        "temperature": forecast.temperature,
                        "sunrise": Time.at(forecast.sunrise).to_datetime,
                        "sunset": Time.at(forecast.sunset).to_datetime,
                        "feels_like": forecast.feels_like,
                        "humidity": forecast.humidity,
                        "uvi": forecast.uvi,
                        "visibility": forecast.visibility,
                        "conditions": forecast.conditions,
                        "icon": forecast.icon
                    },
                    "daily_weather": forecast.daily.map do |day|
                        {
                        "date": Time.at(day.date).to_date,
                        "sunrise": Time.at(day.sunrise).to_datetime,
                        "sunset": Time.at(day.sunset).to_datetime,
                        "min_temp": day.min_temp,
                        "max_temp": day.max_temp,
                        "conditions": day.conditions,
                        "icon": day.icon
                        }  
                    end,
                    "hourly_weather": forecast.hourly.map do |hour|
                        {
                        "time": Time.at(hour.time).to_time.strftime('%T'),
                        "temp": hour.temp,
                        "conditions": hour.conditions,
                        "icon": hour.icon
                        }   
                    end
                }
            }
        }
    end
end