class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?

  # 開発環境以外ならエラーハンドリング処理
  if !Rails.env.development?
  rescue_from Exception, with: :render_error500
  rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :render_error404
  end
  # エラー処理
  def raise_routing_error!
    raise ActionController::RoutingError.new("No route matches '#{params[:unmatched_route]}'")
  end

  def render_error404(e = nil)
    render 'errors/error_404', status: 404, formats: [:html]
  end

  def render_error500(e = nil)
    logger.error "500 SERVER ERROR"
    logger.error e.message
    logger.error e.backtrace.join("\n")
    render 'errors/error_500', status: 500, formats: [:html]
  end

  private

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticate
    return if logged_in?
    redirect_to root_path, alert: 'ログインしてください'
  end
end
