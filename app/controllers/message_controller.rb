class MessageController < ApplicationController
  before_filter :authenticate_user!

  def index

  end

  def show
    @message = Message.find(params[:id])
  end
end