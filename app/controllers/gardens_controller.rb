class GardensController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @gardens = policy_scope(Garden).search_by_address(params[:query])
    else
      @gardens = policy_scope(Garden).order(created_at: :desc)
    end
    # geolocation markers
    @markers = @gardens.geocoded.map do |garden|
      {
        lat: garden.latitude,
        lng: garden.longitude,
        info_window: render_to_string(partial: "info_window", locals: { garden: garden })
      }
    end
  end

  def new
    @garden = Garden.new
    authorize @garden
  end

  def create
    @garden = Garden.new(garden_params)
    @garden.booked << { from: garden_params[:start_date], to: garden_params[:end_date]}
    @garden.user = current_user
    authorize @garden
    if @garden.save
      redirect_to garden_path(@gardens)
    else
      render :new
    end
  end

  def show
    @garden = Garden.find(params[:id])
    authorize @garden
  end

  private

  def gardens_params
    params.require(:garden).permit(:name, :description, :address, :price_per_day, :start_date, :end_date)
  end

end
