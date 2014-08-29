class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(:user_name => params[:user_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Logged in!"
    else
      flash.now.alert = "User name or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: "Logged out!"
  end
end
