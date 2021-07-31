class GardensController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @gardens = policy_scope(Garden).order(created_at: :desc)
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)
    @garden.user = current_user
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
