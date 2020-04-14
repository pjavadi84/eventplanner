class User < ApplicationRecord
    has_many :events
    has_many :properties, through: :events
    has_secure_password
end
