class TopController < ApplicationController
  protect_from_forgery with: :exception

  helper_method :logged_in?

  def index
    @twitter_user = TwitterUser.find(session[:user_id]) if session[:user_id].present?

  end

  private
  def logged_in?
    !!session[:user_id]
  end

end
