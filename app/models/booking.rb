class Booking < ApplicationRecord
  belongs_to :garden
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :end_date_after_start_date?
    def end_date_after_start_date?
      if end_date < start_date
        errors.add :end_date, "must be after start date"
      end
    end


  def add_booked_days_to_garden
    self.garden.booked << { from: self.start_date, to: self.end_date }
  end

  # def datetime_sequence(start, stop)
  #   dates = [start]
  #   while dates.last < (stop - 1.day)
  #     dates << (dates.last + 1.day)
  #   end
  #   dates << stop
  #   return dates
  # end
end
