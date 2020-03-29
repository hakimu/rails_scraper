class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  include ApplicationHelper

  def auth_current_user
    raise NotAuthForSongError.new('Not authorized') unless current_song_include_current_user?
  end

  def current_song_include_current_user?
    Song.find(params[:id]).user_ids.include?(current_user.id)
  end
end
