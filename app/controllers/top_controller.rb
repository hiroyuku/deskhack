class TopController < ApplicationController
  protect_from_forgery with: :exception

  helper_method :logged_in?

  def index

  end

  private
  def logged_in?
    !!session[:user_id]
  end

end
