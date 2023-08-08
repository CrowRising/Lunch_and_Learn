class Api::V1::FavoritesController < ApplicationController
  
  def create
    user = User.find_by(api_key: params[:api_key])
    return error unless user
    new_fave = Favorite.create(favorite_params)
    new_fave.update(user_id: user.id) 
    render json: { success: "Favorite added successfully"}, status: 201
  end

  private
  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title, :user_id)
  end

  def error
    render json: { error: "Unauthorized user" }, status: 401  
  end
end