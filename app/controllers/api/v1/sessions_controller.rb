class Api::V1::SessionsController < ApplicationController
    def create
        user_info = JSON.parse(request.raw_post, symbolize_names: true)
        user = User.find_by(email: user_info[:email])
        if user && user.authenticate(user_info[:password])
            render json: UserSerializer.user(user), status: 200
        else
            render json: {"error": "Email or password were incorrect"}, status: 400
        end
    end
end