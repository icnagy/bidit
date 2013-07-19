class LoginController < ApplicationController
  def login
    respond_to do |format|
      if params[:email] && User.where(:email => params[:email], :password => params[:password]).exists?
        @user = User.where(:email => params[:email], :password => params[:password]).first
        session[:user_id] = @user.id
        session[:is_admin] = @user.is_admin
        session[:username] = @user.name
        format.html { redirect_to item_auctions_path }
      else
        format.html
      end
    end
  end

  def logout
    session[:user_id] = nil
    session[:is_admin] = nil
    session[:username] = nil
    redirect_to :root
  end
end
