class UsersController < ApplicationController
  
  before_action :check_logged_in, :only => [:edit, :show]
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = @current_user
  end

  def update
    user = @current_user
    user.update user_params
    redirect_to root_path
  end

  def show
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :image, :password, :password_confirmation)
  end

  def check_logged_in
    redirect_to root_path unless @current_user.present?
  end

end