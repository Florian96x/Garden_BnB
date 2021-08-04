class RemoveAvailableDatesFromGardens < ActiveRecord::Migration[6.0]
  def change
    remove_column :gardens, :available_dates, :date
  end
end
