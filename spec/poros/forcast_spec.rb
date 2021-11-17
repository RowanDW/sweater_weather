require 'rails_helper'

RSpec.describe 'Forecast object' do
    it 'exists and has attributes' do

        weather_data  = File.read('spec/fixtures/weather_response.json')
        weather_data = JSON.parse(weather_data, symbolize_names: true)

        weather = Forecast.new(weather_data)

        expect(weather).to be_a(Forecast)
        expect(weather.datetime.to_s).to eq("1637026801")
        expect(weather.temperature).to eq(64.78)
        expect(weather.sunrise.to_s).to eq("1636980480")
        expect(weather.sunset.to_s).to eq("1637018033")
        expect(weather.feels_like).to eq(64.85)
        expect(weather.humidity).to eq(83)
        expect(weather.uvi).to eq(0)
        expect(weather.visibility).to eq(10000)
        expect(weather.conditions).to eq("clear sky")
        expect(weather.icon).to eq("01n")
        expect(weather.daily).to be_a(Array)
        expect(weather.hourly).to be_a(Array)
    end

    it 'create_dailies' do
        weather_data  = File.read('spec/fixtures/weather_response.json')
        weather_data = JSON.parse(weather_data, symbolize_names: true)

        weather = Forecast.new(weather_data)
        dailies = weather.create_dailies(weather_data[:daily])
        expect(dailies).to be_a(Array)
        expect(dailies.count).to eq(5)
        expect(dailies.first).to be_a(DailyWeather)
    end

    it 'create_hourlies' do
        weather_data  = File.read('spec/fixtures/weather_response.json')
        weather_data = JSON.parse(weather_data, symbolize_names: true)

        weather = Forecast.new(weather_data)
        hourlies = weather.create_hourlies(weather_data[:hourly])
        expect(hourlies).to be_a(Array)
        expect(hourlies.count).to eq(8)
        expect(hourlies.first).to be_a(HourlyWeather)
    end
end
