class AddBookedToGardens < ActiveRecord::Migration[6.0]
  def change
    add_column :gardens, :booked, :text
  end
end
