class ActivitySerializer
    def self.activities(forecast, activities, destination)
        {
            "data": {
                "id": nil,
                "type": "activities",
                "attributes": {
                    "destination": destination,
                    "forecast": {
                        "summary": forecast[:summary],
                        "temperature": "#{forecast[:temperature]} F"
                    },
                    "activities": activities.map do |act|
                        {
                        "title": act.title,
                        "type": act.type,
                        "participants": act.participants,
                        "price": act.price
                        }
                    end
                }
            }
        }
    end
end