module ApplicationHelper

  def is_admin?
    #session[:is_admin] = true
    #session[:user_id] = 403821611
    session[:is_admin]
  end

  def current_username
    session[:username].nil? ? "" : session[:username]
  end

end
