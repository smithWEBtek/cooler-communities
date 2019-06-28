class UsersController < ApplicationController
  before_action :authorize_admin, only: [:destroy]
  before_action :set_user, only: [:export_csv, :show, :edit, :update, :destroy]
  # before_action :authenticate_user!, only: [:show]
  before_action :require_login, only: [:show]

  def index
    @users = User.all
    if current_user && current_user.admin?
      respond_to do |f|
        f.html { render :index }
        f.json { render json: @users }
      end
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
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @user }
    end
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
      phone: params[:user][:phone],
      affiliation_id: params[:affiliation][:affiliation_id],
      admin: params[:user][:admin]
      )

    if @user.save
      UserSurvey.create(user_id: @user.id, survey_id: 1)
      redirect_to login_path
      flash[:notice] = "#{@user.username}, you have successfully registered, please login."
		else
      flash[:error] = "Please enter the required fields."
      render :new
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
    @users = User.all
    # respond_to do |format|
    #   format.csv {send_data @users.to_csv}
    # end

    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users_report_#{Date.today}.csv" }
    end
    # render '/users/users_report.csv.erb'
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:admin, :username, :password, :password_confirmation, :first_name, :last_name, :email, :address, :city, :state, :zipcode, :phone, :affiliation_id)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

  # def welcome
  #   if @user
  #     render :welcome
  #   else
  #     redirect_to login_path
  #   end
  # end
end
