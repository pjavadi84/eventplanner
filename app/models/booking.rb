class Booking < ApplicationRecord
    belongs_to :event
    belongs_to :user

    def book_event
        if age_requirement_not_met && event_not_matched && capacity_is_full

        else

        end
    end

    def age_requirement_not_met
        "sorry the age is not meeting the minimum age requirement"
    end

    def event_not_matched
        "this event is not matched with the event that you are interested"
    end

    def capacity_is_full
        "Sorry! the event is sold out"
    end

    def sort_by_price

    end

    def sort_by_zip_code

    end

    def sort_by_event_type
        
    end
end
