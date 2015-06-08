class BookingsController < ApplicationController
  
  before_action :clear_session_url

  def create
    if slot_is_available()
      booking = Booking.create(booking_params)
      if booking.save
        redirect_to booking_path(booking.id)
      else
        flash[:warning] = "Booking could not be made, please try again"
        redirect_to property_path(params[:property_id])
      end
    else
      flash[:warning] = "Booking could not be made, please try again"
      redirect_to property_path(params[:property_id])
    end
  end

  def show
    @booking = Booking.find params[:id]
  end


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

  def slot_is_available
    bookings = Booking.where("property_id = ?", params[:property_id]).where("check_in >= ?", params[:check_in]).where("booking_status_id = 1 OR booking_status_id = 2")
    
    check = true
    bookings.each do |booking|
      check = false if ((booking.check_in <= Date.parse(params[:check_out])) && (booking.check_out >= Date.parse(params[:check_in])))
    end

    return check
  end

end


