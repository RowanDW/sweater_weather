class ImageSerializer
    def self.image(image_data, location)
        {
            "data": {
                "type": "image",
                "id": nil,
                "attributes": {
                    "image": {
                        "location": location,
                        "image_url": image_data[:urls][:regular],
                        "credit": {
                            "source": "unsplash.com",
                            "author": image_data[:user][:name]                        
                        }
                    }
                }
            }
        }
    end
end