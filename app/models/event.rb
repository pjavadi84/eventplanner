class Event < ApplicationRecord
    belongs_to :property
    has_many :comments
    has_many :users, through: :comments
    validates :event_name, :ticket_price, :minimum_age, :number_of_guests, :event_date, presence: true
end
