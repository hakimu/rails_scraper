class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.save
  end

  def show
    user = User.find(params[:id])
    songs = user.songs
    render json: { user: user, songs: songs, likes: user.likes }
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
