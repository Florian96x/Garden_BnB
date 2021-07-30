class Garden < ApplicationRecord
  belongs_to :user 
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 50 }
  validates :address, presence: true
  validates :price_per_day, presence: true
end
 