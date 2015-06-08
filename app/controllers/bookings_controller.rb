class BookingsController < ApplicationController
  
  before_action :clear_session_url

  def create
    booking = Booking.create(booking_params)
    if booking.save
      redirect_to booking_path(booking.id)
    else
      flash[:warning] = "Booking could not be made, please try again"
      render :new
    end
  end

  def show
    @booking = Booking.find params[:id]
  end

  # THESE NEED SECURITY!!
  # Mark a request as accepted
  def accept
    @booking = Booking.find params[:id]
    if is_owner()
      @booking.update_attribute(:booking_status_id, 2)
      redirect_to user_rentals_path
    else
      redirect_to login_path
    end
  end

  # Mark a request as declined
  def decline
    @booking = Booking.find params[:id]
    if is_owner()
      @booking.update_attribute(:booking_status_id, 3)
      redirect_to user_rentals_path
    else
      redirect_to login_path
    end
  end

  # Mark a request as cancelled
  def cancel
    @booking = Booking.find params[:id]
    if is_owner() || is_renter
      @booking.update_attribute(:booking_status_id, 4)
      redirect_to user_rentals_path
    else
      redirect_to login_path
    end
  end


  private
  def booking_params
    params.permit(:check_in, :check_out, :property_id, :user_id, :booking_status_id, :rent, :cleaning_fee, :service_fee, :guest_count, :check_in_time, :check_out_time)
  end

  def is_renter
    answer = false
    answer = true if @booking.user_id == @current_user.id
    return answer
  end

  def is_owner
    answer = false
    answer = true if @booking.property.user_id == @current_user.id
    return answer
  end

end


