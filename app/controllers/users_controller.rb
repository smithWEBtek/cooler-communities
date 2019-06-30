class UsersController < ApplicationController
  before_action :authorize_admin, only: [:destroy]
  before_action :set_user, only: [:export_csv, :show, :edit, :update, :destroy, :reset_password]
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
      state: params[:user][:state],
      zipcode: params[:user][:zipcode],
      phone: params[:user][:phone],
      affiliation_id: params[:user][:affiliation_id],
      admin: params[:user][:admin]
      )

    if params[:user][:password] == params[:user][:password_confirmation] && @user.save
      UserSurvey.create(user_id: @user.id, survey_id: 1)
      flash[:notice] = "#{@user.username}, you have successfully registered, please login."
      redirect_to root_path
    else
      flash[:notice] = "Errors: #{@user.errors.full_messages}"
      render :new
    end
  end

  def edit
    @minimum_password_length = 6
  end

  def update
    @user.update(first_name: params[:user][:first_name], 
      last_name: params[:user][:last_name],
      username: params[:user][:username],
      email: params[:user][:email],
      address: params[:user][:address],
      city: params[:user][:city],
      state: params[:user][:state],
      zipcode: params[:user][:zipcode],
      phone: params[:user][:phone],
      affiliation_id: params[:user][:affiliation_id],
      admin: params[:user][:admin])

    if !params[:user][:password].empty?
      @user.password = params[:user][:password]
      @user.password_confirmation = params[:user][:password_confirmation]
    end

    if params[:user][:password] == params[:user][:password_confirmation] && @user.save
      flash[:notice] = 'User Account updated.'
      redirect_to root_path
    else
      # binding.pry
      flash[:notice] = @user.errors.full_messages[0]
      render :edit
    end
  end

  def destroy
    if @user.delete
      flash[:notice] = 'User deleted'
      redirect_to users_path
    else
      # flash[:notice] = @user.errors.full_messages
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

  def reset_password
    if current_user && current_user.admin?
      @user.reset_password
      flash[:notice] = "#{@user.username} password reset to: 'password'. Please change it when you log in."
      redirect_to login_path
    else
      redirect_to root_path
    end
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
