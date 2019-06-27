class UsersController < ApplicationController
  before_action :authorize_admin, only: [:destroy]
  before_action :set_user, only: [:export_csv, :show, :edit, :update, :destroy]
  # before_action :authenticate_user!, only: [:show]
  before_action :require_login, only: [:show]

  def index
    @users = User.all
    if current_user && current_user.admin?
      # redirect_to users_path
      render 'index'
    else
      flash[:notice] = "Admins only. Redirecting to HOME page."
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def auth
    @user = User.find
    render 'users/login'
  end

  def user_summary
    @user = current_user
    render '/users/user_summary.csv.erb'
  end

  def show
    @user = current_user unless current_user.admin?
  end

  def create
		@user = User.new(
      first_name: params[:user][:first_name], 
      last_name: params[:user][:last_name],
      username: params[:user][:username],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation],
      email: params[:user][:email],
      address: params[:user][:address],
      city: params[:user][:city],
      state: params[:state],
      zipcode: params[:user][:zipcode],
      phone: params[:user][:phone]
      )

    if @user.save && @user.password == @user.password_confirmation
      flash[:success] = "You have successfully registered and logged in"
      session[:user_id] = @user.id
      welcome
      redirect_to root_path
		else
      flash[:error] = "You must register before logging in"
      redirect_to '/users/new'
    end
  end

  def edit
    @user
  end

  def update
    @user.update_without_password(user_params)
    if @user.save
      flash[:notice] = 'User Account updated.'
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    if @user.delete
      flash[:notice] = 'User deleted'
      redirect_to root_path
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to user_path(@user)
    end
  end

  def users_report
    puts "downloading CSV of USERS ******************************"
    puts "downloading CSV of USERS ******************************"
    puts "downloading CSV of USERS ******************************"
    puts "downloading CSV of USERS ******************************"
    puts "downloading CSV of USERS ******************************"
    @user = current_user
    render '/users/user_summary.csv.erb'
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email, :address, :city, :state, :zipcode, :phone)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

  def welcome
    if @user
      render :welcome
    else
      redirect_to login_path
    end
  end
end
