class TwitterUsersController < ApplicationController

  def index
    @twitter_user = TwitterUser.find(params[:id])

  end


end
