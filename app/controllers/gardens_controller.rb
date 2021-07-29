class GardensController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show] # add show to it

  def index
    @gardens = Garden.all
  end

  def show
    @garden = Garden.find(params[:id])
  end

  def new
    @garden = Garden.new
  end
  
  def create
    @garden = Garden.new(garden_params)
    if @garden.save
      redirect_to garden_path(@gardens)
    else
      render :new
    end
  end

  private

  def gardens_params
    params.require(:garden).permit(:name, :description, :address, :available_dates, :price_per_day)
  end   
end
