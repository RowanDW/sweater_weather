class RoadtripSerializer
    def self.trip(roadtrip)
        {
            "data": {
                "id": nil,
                "type": "roadtrip",
                "attributes": {
                    "start_city": roadtrip.start_city,
                    "end_city": roadtrip.end_city,
                    "travel_time": roadtrip.travel_time,
                    "weather_at_eta": {
                        "temperature": roadtrip.destination_weather[:temperature],
                        "conditions": roadtrip.destination_weather[:conditions]
                    }
                }
            }
        }
    end

    
end