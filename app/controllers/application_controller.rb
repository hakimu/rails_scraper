class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  include ApplicationHelper
  before_action :auth_current_user # Figure out where to place this.  Shouldn't stay here.

  def auth_current_user
  end
end
