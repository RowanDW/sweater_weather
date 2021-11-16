class ImageSerializer
    def self.image(image, location)
        {
            "data": {
                "type": "image",
                "id": nil,
                "attributes": {
                    "image": {
                        "location": location,
                        "image_url": image.url,
                        "credit": {
                            "source": "unsplash.com",
                            "author": image.author                      
                        }
                    }
                }
            }
        }
    end
end