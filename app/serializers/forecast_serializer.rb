class ForecastSerializer

    def self.forecast(forecast)
        {
            "data": {
                "id": nil,
                "type": "forecast",
                "attributes": {
                    "current_weather": {
                        "datetime": Time.at(forecast[:current][:dt]).to_datetime,
                        "temperature": forecast[:current][:temp],
                        "sunrise": Time.at(forecast[:current][:sunrise]).to_datetime,
                        "sunset": Time.at(forecast[:current][:sunset]).to_datetime,
                        "feels_like": forecast[:current][:feels_like],
                        "humidity": forecast[:current][:feels_like],
                        "uvi": forecast[:current][:uvi],
                        "visibility": forecast[:current][:visibility],
                        "conditions": forecast[:current][:weather].first[:description],
                        "icon": forecast[:current][:weather].first[:icon]
                    },
                    "daily_weather": forecast[:daily].map do |day|
                        {
                        "date": Time.at(day[:dt]).to_date,
                        "sunrise": Time.at(day[:sunrise]).to_datetime,
                        "sunset": Time.at(day[:sunset]).to_datetime,
                        "min_temp": day[:temp][:min],
                        "max_temp": day[:temp][:max],
                        "conditions": day[:weather].first[:description],
                        "icon": day[:weather].first[:icon]
                        }  
                    end.take(5),
                    "hourly_weather": forecast[:hourly].map do |hour|
                        {
                        "time": Time.at(hour[:dt]).to_time.strftime('%T'),
                        "temp": hour[:temp],
                        "conditions": hour[:weather].first[:description],
                        "icon": hour[:weather].first[:icon]
                        }   
                    end.take(8)
                }
            }
        }
    end
end