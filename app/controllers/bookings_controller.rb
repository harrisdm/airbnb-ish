class BookingsController < ApplicationController
  def index
    @bookings_breakdown = {}
    BookingStatus.all.each do |status|
      @bookings_breakdown[status.name] = Booking.where(:booking_status_id => status.id)
    end
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
