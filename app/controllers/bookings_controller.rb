class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @garden = Garden.find(params[:garden_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    @garden = Garden.find(params[:garden_id])
    @booking.garden = @garden
    @booking.user = current_user
    
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def bookings_params
    params.require(:booking).permit(:user_introduction, :start_date, :end_date)
  end

  # TO DO, implement total_price logic

end
