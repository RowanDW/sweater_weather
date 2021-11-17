# Sweater Weather

## Table of contents
- [Overview](#overview)
- [App Screenshots](#app-screenshots)
- [Technologies](#technologies)
- [Contributors](#contributors)

### Overview
Sweater Weather is an api backend designed to help people plan road trips. The app allows users to register and log in, see weather forcasts for any city, as well as the forcast for their roadtrip desination at their ETA.

This application consumes the following APIs:
* [MapQuest Geocoding and Routes](https://developer.mapquest.com/documentation/geocoding-api/)
* [OpenWeather](https://openweathermap.org/api/one-call-api)
* [Unsplash Photo Search](https://unsplash.com/documentation#search-photos)

### SetUp
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
![LinkedIn][https://www.linkedin.com/in/rowandelong](https://www.linkedin.com/in/rowandelong)

- [Rowan DeLong](https://www.linkedin.com/in/rowandelong/)

![Github][github-badge]

- [Rowan DeLong](https://github.com/RowanDW)



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
