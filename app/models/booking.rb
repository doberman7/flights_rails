class Booking < ApplicationRecord
  has_many :user_bookings
  has_many :users, through: :user_bookings
  
  belongs_to :flight
end
