class MapquestFacade 
    def self.get_coordinates(location)
        city_data = MapquestService.get_city_data(location)
        latlng = city_data[:results].first[:locations].first[:latLng]
    end
end