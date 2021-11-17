require 'rails_helper'

RSpec.describe 'Daily Weather object' do
    it 'exists and has attributes' do

        weather_data = {
            dt: 1636999200,
            sunrise: 1636983900,
            sunset: 1637019867,
            moonrise: 1637014500,
            moonset: 1636970460,
            moon_phase: 0.39,
            temp: {day: 69.51, min: 51.51, max: 69.51, night: 56.84, eve: 62.65, morn: 52.25},
            feels_like: {day: 66.96, night: 53.4, eve: 59.47, morn: 48.92},
            pressure: 1013,
            humidity: 17,
            dew_point: 23.88,
            wind_speed: 7.72,
            wind_deg: 202,
            wind_gust: 12.41,
            weather: [{id: 801, main: "Clouds", description: "few clouds", icon: "02d"}],
            clouds: 11,
            pop: 0,
            uvi: 2.28
        }

        weather = DailyWeather.new(weather_data)

        expect(weather).to be_a(DailyWeather)
        expect(weather.date.to_s).to eq("1636999200")
        expect(weather.sunrise.to_s).to eq("1636983900")
        expect(weather.sunset.to_s).to eq("1637019867")
        expect(weather.min_temp).to eq(51.51)
        expect(weather.max_temp).to eq(69.51)
        expect(weather.conditions).to eq("few clouds")
        expect(weather.icon).to eq("02d")
    end
end
