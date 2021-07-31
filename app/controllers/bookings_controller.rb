class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@bookings)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def bookings_params
    params.require(:booking).permit(:user_introduction, :total_price, :start_date, :end_date)
  end

  # TO DO, implement total_price logic

end
