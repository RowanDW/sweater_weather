class Api::V1::UsersController < ApplicationController

    def create
        user_info = JSON.parse(request.raw_post, symbolize_names: true)
        user_info[:api_key] = generate_api_key
        user = User.new(user_info)
        if user.save
            render json: UserSerializer.user(user), status: 201
        else
            render json: {"error": "Invalid Registration"}, status: 400
        end
    end

    private

    def generate_api_key
        SecureRandom.hex(16)
    end
end