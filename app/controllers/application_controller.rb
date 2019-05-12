class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  helper_method :user_signed_in?, :admin?
  
  def user_signed_in?
    !!current_user
  end
  
  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only, you have been redirected to HOME page.'
  end
end
