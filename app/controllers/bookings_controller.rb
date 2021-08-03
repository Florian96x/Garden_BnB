class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def new
    @garden = Garden.find(params[:garden_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(bookings_params)
    @garden = Garden.find(params[:garden_id])
    @booking.garden = @garden
    @booking.user = current_user
    authorize @booking
    
    if @booking.save
      add_booked_days_to_garden(@booking, @garden)
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

  def add_booked_days_to_garden(booking, garden)
    garden.booked << datetime_sequence(booking.start_date, booking.end_date)
  end

  def datetime_sequence(start, stop)
    dates = [start]
    while dates.last < (stop - 1.day)
      dates << (dates.last + 1.day)
    end
    dates << stop
    return dates
  end

  # TO DO, implement total_price logic
end
