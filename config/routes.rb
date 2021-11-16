Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'city_weather#forecast'
      get '/backgrounds', to: 'city_weather#backgrounds'
      post '/users', to: 'users#create'
    end
  end
end
