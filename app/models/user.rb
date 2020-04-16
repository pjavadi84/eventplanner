class User < ApplicationRecord
    has_many :properties
    has_many :events, through: :properties
    has_many :bookings
    has_secure_password
end
