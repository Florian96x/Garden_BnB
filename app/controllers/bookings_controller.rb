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
      @booking.add_booked_days_to_garden
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def update
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update_column(:status, "accepted")
    @booking.add_booked_days_to_garden
    authorize @booking
    redirect_to profile_path(current_user)
    # respond_to do |format|
    #   format.html { redirect_to profile_path(current_user) }
    #   format.js
    # end
  end

  private

  def bookings_params
    params.require(:booking).permit(:user_introduction, :start_date, :end_date)
  end

  # TO DO, implement total_price logic
end
