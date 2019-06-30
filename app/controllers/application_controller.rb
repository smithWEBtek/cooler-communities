class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in? , :authentication_required

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to '/login' unless current_user
  end

  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only, you have been redirected to HOME page.'
  end

  def authentication_required
    if !logged_in?
      redirect_to 'login'
    end
  end

  def logged_in?
    !!current_user
  end
end
