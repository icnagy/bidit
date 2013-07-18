module ApplicationHelper

  def is_admin?
    session[:is_admin]
  end

  def current_username
    session[:username].nil? ? "" : session[:username]
  end

  def current_userrole
    session[:user_role].nil? ? "" : session[:user_role]
  end

end
