# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  helper_method :current_user, :logged_in?
  
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
