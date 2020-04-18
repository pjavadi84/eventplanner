class Event < ApplicationRecord
    belongs_to :property
    has_many :bookings
    validates :event_name, :ticket_price, :minimum_age, :number_of_guests, :event_date, presence: true
    validates :event_name, uniqueness: true
end
