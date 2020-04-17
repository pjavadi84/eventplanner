class Property < ApplicationRecord
    belongs_to :user 
    has_many :events
    validates :property_name, :event_type, :date_created, :maximum_occupancy, :address, :city, :state, :zipcode, presence: true
    validates :property_name, :address, uniqueness: true
end
