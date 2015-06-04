class UsersController < ApplicationController
  
  before_action :check_logged_in, :only => [:edit, :show]
  
  def new
    @user = User.new
    session[:return_to] ||= request.referer if request.referer != request.original_url
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to session.delete(:return_to)
    else
      flash[:warning] = "Sign up failed, please try again"
      #render :new    #flash message lasts 2 clicks 
      redirect_to signup_path
    end
  end

  def edit
    @user = @current_user
  end

  def update
    user = @current_user
    if user.update user_params
      redirect_to session.delete(:return_to)
    else
      flash[:warning] = "Update failed, please try again"
      redirect_to signup_path
    end
  end

  def properties
    @properties = Property.where(:user_id => @current_user.id).where(:active => true)
  end

  def rentals
    @breakdown = {}
    BookingStatus.all.each do |status|
      @breakdown[status.name] = Booking.where(:booking_status_id => status.id).joins(:property).where("properties.user_id" => @current_user.id)
    end
  end

  def bookings
    @breakdown = {}
    BookingStatus.all.each do |status|
      @breakdown[status.name] = Booking.where(:user_id => @current_user.id).where(:booking_status_id => status.id)
    end
  end

  def show
    @user = @current_user
    @user = User.find params[:id] if params[:id].present?
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :image, :password, :password_confirmation)
  end

  def check_logged_in
    redirect_to root_path unless @current_user.present?
  end

end