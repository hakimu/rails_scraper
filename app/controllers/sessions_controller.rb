class SessionsController < ApplicationController
  def new
  end

  def create
    user = set_user
    if user && user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :songs, notice: 'Login Successful'
    else
      flash.alert = 'Login Failed'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logout Successful'
  end

  private

  def set_user
    User.find_by(username: params[:username])
  end
end
