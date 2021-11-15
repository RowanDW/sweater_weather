require 'rails_helper'

RSpec.describe 'openweather service', :vcr do
  it 'finds weather forcast info based on latitude and longitude' do
    response = OpenweatherService.get_city_weather(33.44, -94.04)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:current)

    expect(response[:current]).to be_a(Hash)
    expect(response[:current]).to have_key(:dt)
    expect(response[:current][:dt]).to be_a(Integer)
    expect(response[:current]).to have_key(:sunrise)
    expect(response[:current][:sunrise]).to be_a(Integer)
    expect(response[:current]).to have_key(:sunset)
    expect(response[:current][:sunset]).to be_a(Integer)
    expect(response[:current]).to have_key(:temp)
    expect(response[:current][:temp]).to be_a(Float)
    expect(response[:current]).to have_key(:feels_like)
    expect(response[:current][:feels_like]).to be_a(Float)
    expect(response[:current]).to have_key(:humidity)
    expect(response[:current][:humidity]).to be_a(Integer)
    expect(response[:current]).to have_key(:uvi)
    expect(response[:current][:uvi]).to be_a(Numeric)
    expect(response[:current]).to have_key(:visibility)
    expect(response[:current][:visibility]).to be_a(Integer)
    expect(response[:current]).to have_key(:weather)
    expect(response[:current][:weather]).to be_a(Array)
    expect(response[:current][:weather].first).to be_a(Hash)
    expect(response[:current][:weather].first).to have_key(:description)
    expect(response[:current][:weather].first[:description]).to be_a(String)
    expect(response[:current][:weather].first).to have_key(:icon)
    expect(response[:current][:weather].first[:icon]).to be_a(String)

    expect(response).to have_key(:daily)
    expect(response[:daily]).to be_a(Array)
    first_day = response[:daily].first

    expect(first_day).to have_key(:dt)
    expect(first_day[:dt]).to be_a(Integer)
    expect(first_day).to have_key(:sunrise)
    expect(first_day[:sunrise]).to be_a(Integer)
    expect(first_day).to have_key(:sunset)
    expect(first_day[:sunset]).to be_a(Integer)

    expect(first_day).to have_key(:temp)
    expect(first_day).to be_a(Hash)
    expect(first_day[:temp]).to have_key(:min)
    expect(first_day[:temp][:min]).to be_a(Float)
    expect(first_day[:temp]).to have_key(:max)
    expect(first_day[:temp][:max]).to be_a(Float)

    expect(first_day).to have_key(:weather)
    expect(first_day[:weather]).to be_a(Array)
    expect(first_day[:weather].first).to be_a(Hash)
    expect(first_day[:weather].first).to have_key(:description)
    expect(first_day[:weather].first[:description]).to be_a(String)
    expect(first_day[:weather].first).to have_key(:icon)
    expect(first_day[:weather].first[:icon]).to be_a(String)

    expect(response).to have_key(:hourly)
    expect(response[:hourly]).to be_a(Array)
    first_hour = response[:hourly].first

    expect(first_hour).to have_key(:dt)
    expect(first_hour[:dt]).to be_a(Integer)
    expect(first_hour).to have_key(:temp)
    expect(first_hour[:temp]).to be_a(Float)

    expect(first_hour).to have_key(:weather)
    expect(first_hour[:weather]).to be_a(Array)
    expect(first_hour[:weather].first).to be_a(Hash)
    expect(first_hour[:weather].first).to have_key(:description)
    expect(first_hour[:weather].first[:description]).to be_a(String)
    expect(first_hour[:weather].first).to have_key(:icon)
    expect(first_hour[:weather].first[:icon]).to be_a(String)
  end
end
