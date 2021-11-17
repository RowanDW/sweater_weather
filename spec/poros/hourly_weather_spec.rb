require 'rails_helper'

RSpec.describe 'Hourly Weather object' do
    it 'exists and has attributes' do

        weather_data = {
            dt: 1636995600,
            temp: 68.09,
            feels_like: 65.5,
            pressure: 1014,
            humidity: 19,
            dew_point: 25.2,
            uvi: 1.57,
            clouds: 10,
            visibility: 10000,
            wind_speed: 4.41,
            wind_deg: 227,
            wind_gust: 7.29,
            weather: [{id: 800, main: "Clear", description: "clear sky", icon: "01d"}],
            pop: 0
        }

        weather = HourlyWeather.new(weather_data)

        expect(weather).to be_a(HourlyWeather)
        expect(weather.time).to eq(1636995600)
        expect(weather.temp).to eq(68.09)
        expect(weather.conditions).to eq("clear sky")
        expect(weather.icon).to eq("01d")
    end
end
