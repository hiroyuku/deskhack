class PostsController < ApplicationController

  helper_method :logged_in?

  def index
    @twitter_user = TwitterUser.find(session[:user_id]) if session[:user_id].present?
  end

  def new

  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def logged_in?
    !!session[:user_id]
  end

end
