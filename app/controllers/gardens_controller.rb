class GardensController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @gardens = policy_scope(Garden).order(created_at: :desc)
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
    params.require(:garden).permit(:name, :description, :address, :available_dates, :price_per_day)
  end

end
