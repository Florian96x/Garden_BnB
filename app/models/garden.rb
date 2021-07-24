class Garden < ApplicationRecord
  belongs_to :user

  def index
    @gardens = Garden.all
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
 
