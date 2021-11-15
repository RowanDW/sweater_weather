require 'rails_helper'

RSpec.describe 'the city weather forecast endpoint' do  
    it 'returns the weather data for the given city', :vcr do
        get '/api/v1/forecast?location=denver,co'

        expect(response).to be_successful

        weather = JSON.parse(response.body, symbolize_names: true)
    
        expect(weather).to be_a Hash
        expect(weather[:data]).to be_a Hash
        expect(weather[:data][:id]).to eq(nil)
        expect(weather[:data][:type]).to eq('forecast')
        expect(weather[:data][:attributes]).to be_a(Hash)

        expect(weather[:data][:attributes][:current_weather]).to be_a(Hash)
        current = weather[:data][:attributes][:current_weather]
        expect(current[:datetime].to_datetime).to be_a(DateTime)
        expect(current[:temperature]).to be_a(Float)
        expect(current[:sunrise].to_datetime).to be_a(DateTime)
        expect(current[:sunset].to_datetime).to be_a(DateTime)
        expect(current[:feels_like]).to be_a(Float)
        expect(current[:humidity]).to be_a(Float)
        expect(current[:uvi]).to be_a(Numeric)
        expect(current[:visibility]).to be_a(Integer)
        expect(current[:conditions]).to be_a(String)
        expect(current[:icon]).to be_a(String)
        expect(current).to_not have_key(:pressure)
        expect(current).to_not have_key(:dew_point)
        expect(current).to_not have_key(:clouds)

        expect(weather[:data][:attributes][:daily_weather]).to be_a(Array)
        expect(weather[:data][:attributes][:daily_weather].count).to eq(5)
        daily = weather[:data][:attributes][:daily_weather].first
        expect(daily[:date].to_date).to be_a(Date)
        expect(daily[:sunrise].to_datetime).to be_a(DateTime)
        expect(daily[:sunset].to_datetime).to be_a(DateTime)
        expect(daily[:min_temp]).to be_a(Float)
        expect(daily[:max_temp]).to be_a(Float)
        expect(daily[:conditions]).to be_a(String)
        expect(daily[:icon]).to be_a(String)
        expect(daily).to_not have_key(:moonrise)
        expect(daily).to_not have_key(:moonset)
        expect(daily).to_not have_key(:windspeed)

        expect(weather[:data][:attributes][:hourly_weather]).to be_a(Array)
        expect(weather[:data][:attributes][:hourly_weather].count).to eq(8)
        hourly = weather[:data][:attributes][:hourly_weather].first
        expect(hourly[:time].to_time).to be_a(Time)
        expect(hourly[:temp]).to be_a(Float)
        expect(hourly[:conditions]).to be_a(String)
        expect(hourly[:icon]).to be_a(String)
        expect(hourly).to_not have_key(:wind_gust)
        expect(hourly).to_not have_key(:pressure)
        expect(hourly).to_not have_key(:uvi)
    end

    it 'returns an error if no location is given', :vcr do
        get '/api/v1/forecast'
        expect(response).to_not be_successful
        error = JSON.parse(response.body, symbolize_names: true)
        expect(error).to eq({error: "No location given"})

        get '/api/v1/forecast?location= '
        expect(response).to_not be_successful
        error = JSON.parse(response.body, symbolize_names: true)
        expect(error).to eq({error: "No location given"})
    end
end