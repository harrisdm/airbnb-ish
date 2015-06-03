class BookingsController < ApplicationController
  def index
    status_list = BookingStatus.all
    @booking_breakdown = {}
    status_list.each do |status|
      @booking_breakdown[status.name] = Booking.where(:booking_status_id => status.id)
    end
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    #raise params.inspect
    booking = Booking.create(booking_params)
    if booking.save
      redirect_to booking_path(booking.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @booking = Booking.find params[:id]
  end

  private
  def booking_params
    params.permit(:check_in, :check_out, :property_id, :user_id, :booking_status_id)
  end
end
