Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'city_weather#forecast'
      get '/backgrounds', to: 'city_weather#backgrounds'
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'
    end
  end
end
