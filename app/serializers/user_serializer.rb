class UserSerializer

    def self.user(user)
        {
            "data": {
                "type": "user",
                "id": user.id,
                "attributes": {
                    "email": user.email,
                    "api_key": user.api_key
                }
            }
        }
    end
end