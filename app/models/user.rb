class User < ApplicationRecord
  has_many :user_bookings
  has_many :bookings, through: :user_bookings
  #has_many :flights, through: :bookings
end
