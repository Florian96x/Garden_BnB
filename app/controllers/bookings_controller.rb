class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_booking, only: [:show, :accept, :decline]

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
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    authorize @booking
  end

  def update
  end

  def accept
    @booking.update_column(:status, "accepted")
    add_booked_days_to_garden(@booking)
    authorize @booking
    redirect_to profile_path(current_user, anchor: "booking-#{@booking.id}")
  end

  def decline
    @booking.update_column(:status, "declined")
    authorize @booking
    redirect_to profile_path(current_user, anchor: "booking-#{@booking.id}")
  end

  private

  def bookings_params
    params.require(:booking).permit(:user_introduction, :start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def add_booked_days_to_garden(booking)
    booked = booking.garden.booked
    booked << { from: booking.start_date, to: booking.end_date }
    booking.garden.update_column(:booked, booked)
  end

end
