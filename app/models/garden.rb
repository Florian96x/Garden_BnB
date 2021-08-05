class Garden < ApplicationRecord
  belongs_to :user 
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 50 }
  validates :address, presence: true
  validates :price_per_day, presence: true

  serialize :booked,Array

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: [ :address],
    using: {
      tsearch: { prefix: true }
    }
end
