class SessionsController < ApplicationController
  def new
  end

  def create
    user = set_user
    if user && user.authenticate(params[:password])
      # session[:user_id] = user.id
      puts session.inspect
      puts "=====I'm logged in===="
    else
      flash.alert = 'Login Failed'
      render 'new'
    end
  end

  def destroy
  end

  private

  def set_user
    User.find_by(username: params[:username])
  end
end
