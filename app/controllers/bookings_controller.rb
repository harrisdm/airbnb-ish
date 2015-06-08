class BookingsController < ApplicationController
  
  before_action :clear_session_url

  def index
    @bookings_breakdown = {}
    BookingStatus.all.each do |status|
      @bookings_breakdown[status.name] = Booking.upComing.where(:booking_status_id => status.id).order("check_in ASC")
    end
  end

  def new
    @booking = Booking.new
  end

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
  def accept
    booking = Booking.find params[:id]
    booking.update_attribute(:booking_status_id, 2)
    redirect_to user_rentals_path
  end

  def decline
    booking = Booking.find params[:id]
    booking.update_attribute(:booking_status_id, 3)
    redirect_to user_rentals_path
  end

  def cancel
    booking = Booking.find params[:id]
    booking.update_attribute(:booking_status_id, 4)
    redirect_to user_rentals_path
  end

  private
  def booking_params
    params.permit(:check_in, :check_out, :property_id, :user_id, :booking_status_id, :rent, :cleaning_fee, :service_fee, :guest_count, :check_in_time, :check_out_time)
  end

end


