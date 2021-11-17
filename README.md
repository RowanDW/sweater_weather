# Sweater Weather

## Table of contents
- [Overview](#overview)
- [SetUp](#setup)
- [Endpoints](#endpoints)
- [Technologies](#technologies)
- [Contact](#contact)

### Overview
Sweater Weather is an api backend designed to help people plan road trips. The app allows users to register and log in, see weather forcasts for any city, as well as the forcast for their roadtrip desination at their ETA.

This application consumes the following APIs:
* [MapQuest Geocoding and Routes](https://developer.mapquest.com/documentation/geocoding-api/)
* [OpenWeather](https://openweathermap.org/api/one-call-api)
* [Unsplash Photo Search](https://unsplash.com/documentation#search-photos)

### Setup
To use this application:

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle install`
    * `rails db:{create,migrate}`
* To setup gems:
    * `bundle exec figaro install`
    * Store API keys in `/config/application.yml` as:
    * `mapquest_key: <YOUR-KEY-HERE>`
    * `openweather_key: <YOUR-KEY-HERE>`
    * `unsplash_access_key: <YOUR-KEY-HERE>`
* Run the test suite with `bundle exec rspec`
* Run your development server with `rails s` to see the app in action.

### Endpoints

#### Get weather forecast for a given city

`GET /api/v1/forecast?location=<LOCATION>`

Example JSON response:

```
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2021-11-16T22:13:08.000-07:00",
                "temperature": 47.75,
                "sunrise": "2021-11-16T06:46:09.000-07:00",
                "sunset": "2021-11-16T16:43:41.000-07:00",
                "feels_like": 47.14,
                "humidity": 41,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "clear sky",
                "icon": "01n"
            },
            "daily_weather": [
                {
                    "date": "2021-11-16",
                    "sunrise": "2021-11-16T06:46:09.000-07:00",
                    "sunset": "2021-11-16T16:43:41.000-07:00",
                    "min_temp": 46.47,
                    "max_temp": 67.98,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                ...
            ],
            "hourly_weather": [
                {
                    "time": "22:00:00",
                    "temp": 47.75,
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                ...
            ]
        }
    }
}
```

#### Get background image for a given city

`GET /api/v1/backgrounds?location=<LOCATION>`

Example JSON response:

```
{
    "data": {
        "type": "image",
        "id": null,
        "attributes": {
            "image": {
                "location": "denver,co",
                "image_url": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzU2ODB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcwOTAxNzc&ixlib=rb-1.2.1&q=80&w=1080",
                "credit": {
                    "source": "unsplash.com",
                    "author": "Dillon Wanner"
                }
            }
        }
    }
}
```
#### Register a User

```
POST /api/v1/users
Content-Type: application/json
Accept: application/json

body:

{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

Example JSON response:

```
{
    "data": {
        "type": "user",
        "id": 1,
        "attributes": {
            "email": "whatever@example.com",
            "api_key": "12345"
        }
    }
}

```

#### Log in a User

```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

body:

{
  "email": "whatever@example.com",
  "password": "password"
}
```

Example JSON response:

```
{
    "data": {
        "type": "user",
        "id": 1,
        "attributes": {
            "email": "whatever@example.com",
            "api_key": "12345"
        }
    }
}

```

#### Get roadtrip data for given cities
```
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "12345"
}
```

Example JSON response:

```
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "Pueblo,CO",
            "travel_time": "01:45:23",
            "weather_at_eta": {
                "temperature": 52.16,
                "conditions": "clear sky"
            }
        }
    }
}
```

### Technologies

#### Versions
- Ruby 2.7.2
- Rails 5.2.5

#### Development
![Ruby on Rails][ruby-on-rails-badge]
![Git][git-badge]
![Faraday][faraday-badge]
![Figaro][figaro-badge]
![Postman][postman-badge]

#### Languages
![Ruby][ruby-badge]

#### Testing
![RSpec][rspec-badge]
![Simplecov][simplecov-badge]
![VCR][vcr-badge]
![Webmock][webmock-badge]
![Pry][pry-badge]
![Shoulda Matchers][shoulda-matchers-badge]

#### Development Principles
![OOP][oop-badge]
![TDD][tdd-badge]
![MVC][mvc-badge]
![REST][rest-badge]


### Contact

* Rowan DeLong
* rowanwinzer@gmail.com
* [LinkedIn](https://www.linkedin.com/in/rowandelong)




<!-- Markdown link & img dfn's -->
[linkedin-badge]:         https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white

[figaro-badge]:           https://img.shields.io/badge/figaro-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[git-badge]:              https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white
[github-badge]:           https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white
[postgreSQL-badge]:       https://img.shields.io/badge/PostgreSQL-4169E1.svg?&style=flaste&logo=postgresql&logoColor=white
[postico-badge]:          https://img.shields.io/badge/postico-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[postman-badge]:          https://img.shields.io/badge/Postman-FF6C37?style=flat&logo=Postman&logoColor=white
[ruby-on-rails-badge]:    https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white

<!-- Languages -->
[activerecord-badge]:     https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white
[ruby-badge]:             https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white

<!-- Deployment -->
[faraday-badge]:          https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white


<!-- Testing -->
[pry-badge]:              https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[rspec-badge]:            https://img.shields.io/badge/rspec-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[shoulda-matchers-badge]: https://img.shields.io/badge/shoulda--matchers-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[simplecov-badge]:        https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[vcr-badge]:              https://img.shields.io/badge/vcr-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[webmock-badge]:          https://img.shields.io/badge/webmock-b81818.svg?&style=flaste&logo=rubygems&logoColor=white

<!-- Development Principles -->
[oop-badge]:              https://img.shields.io/badge/OOP-b81818.svg?&style=flaste&logo=OOP&logoColor=white
[tdd-badge]:              https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white
[mvc-badge]:              https://img.shields.io/badge/MVC-b8b018.svg?&style=flaste&logo=MVC&logoColor=white
[rest-badge]:             https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white
