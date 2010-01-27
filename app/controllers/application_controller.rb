class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def admin?
    session[:admin]
  end
  
  helper_method :admin?
  
  def require_admin
    redirect_to root_path, alert: "Not Authorized" unless admin?
  end
end
