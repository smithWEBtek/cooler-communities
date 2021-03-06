class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = "#{@user.username}, you have successfully logged in, welcome to the survey!"
      redirect_to root_path
    else
      flash[:alert] = "Please enter valid username and password"
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
