class ForecastSerializer

    def self.forecast(forecast)
        {
            "data": {
                "id": nil,
                "type": "forecast",
                "attributes": {
                    "current_weather": {
                        "datetime": forecast.datetime,
                        "temperature": forecast.temperature,
                        "sunrise": forecast.sunrise,
                        "sunset": forecast.sunset,
                        "feels_like": forecast.feels_like,
                        "humidity": forecast.humidity,
                        "uvi": forecast.uvi,
                        "visibility": forecast.visibility,
                        "conditions": forecast.conditions,
                        "icon": forecast.icon
                    },
                    "daily_weather": forecast.daily.map do |day|
                        {
                        "date": day.date,
                        "sunrise": day.sunrise,
                        "sunset": day.sunset,
                        "min_temp": day.min_temp,
                        "max_temp": day.max_temp,
                        "conditions": day.conditions,
                        "icon": day.icon
                        }  
                    end,
                    "hourly_weather": forecast.hourly.map do |hour|
                        {
                        "time": hour.time,
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