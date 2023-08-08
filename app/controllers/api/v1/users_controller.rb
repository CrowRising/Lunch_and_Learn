class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    user.set_api_key
    # require 'pry'; binding.pry
    if user.save
      render json: UserSerializer.new(user), status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :api_key)
  end
end
