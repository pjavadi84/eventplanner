class User < ApplicationRecord
    has_many :properties
    has_many :comments
    has_many :events, through: :comments
    has_secure_password
end
