class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :bookings, dependent: :destroy
  has_many :gardens, dependent: :destroy

  has_one :profile, dependent: :destroy
  after_create :init_profile

  def init_profile
    self.create_profile!
  end
  
end
