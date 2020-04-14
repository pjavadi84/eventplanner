class Property < ApplicationRecord
    has_many :events 
    has_many :users, through: :events
end
