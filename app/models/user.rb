class User < ApplicationRecord
  has_many :user_bookings
  has_many :bookings, through: :user_bookings
  #has_many :flights, through: :bookings
  has_many :user_flights
  has_many :flights, through: :user_flights

  validates :name, presence: true
  validates :email, presence: true, email: true


end
