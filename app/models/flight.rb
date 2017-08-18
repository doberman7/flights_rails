class Flight < ApplicationRecord
  has_many :bookings

  has_many :user_flights
  has_many :users, through: :user_flights
end
