class ApplicationController < ActionController::Base
  protect_from_forgery

  def is_admin?
    #session[:is_admin] = true
    #session[:user_id] = 403821611
    session[:is_admin]
  end

end
