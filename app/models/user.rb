class User < ApplicationRecord
    has_many :properties
    has_many :bookings
    has_many :events, through: :bookings
    has_secure_password
end
