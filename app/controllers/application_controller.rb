class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :user_signed_in?, :admin?
  
  def self.user_signed_in?
    !!current_user
  end
  
  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only, you have been redirected to HOME page.'
  end
end
