class AddQrCodeToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :qr_code, :string
  end
end
