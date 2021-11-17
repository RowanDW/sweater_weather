class MapquestService
  class << self
    def get_city_data(location)
      response = Faraday.get("http://www.mapquestapi.com/geocoding/v1/address?key=#{ENV['mapquest_key']}&location=#{location}")
      parse_json(response)
    end

    def get_trip_data(origin, destination)
      response = Faraday.get("http://www.mapquestapi.com/directions/v2/route?key=#{ENV['mapquest_key']}&from=#{origin}&to=#{destination}")
      parse_json(response)
    end

    private

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
  