class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def logged_in_admin?
    return logged_in? && current_user.admin?
  end

  def require_user
    unless logged_in?
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end

  def require_admin(callback_url = root_url)
    unless logged_in? && current_user.admin?
      flash[:danger] = "Need admin permissions for this action"
      redirect_to callback_url
    end
  end
end
