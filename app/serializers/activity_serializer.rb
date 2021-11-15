class ActivitySerializer
    def self.activities(forecast, activities, destination)
        {
            "data": {
                "id": nil,
                "type": "activities",
                "attributes": {
                    "destination": destination,
                    "forecast": {
                        "summary": forecast[:current][:weather].first[:description],
                        "temperature": "#{forecast[:current][:temp]} F"
                    },
                    "activities": activities.map do |act|
                        {
                        "title": act[:activity],
                        "type": act[:type],
                        "participants": act[:participants],
                        "price": act[:price]
                        }
                    end
                }
            }
        }
    end
end