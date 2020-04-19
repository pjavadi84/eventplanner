class BookingsController < ApplicationController
    def index 
        @bookings = Booking.all
    end

    def new
        @booking = Booking.new
    end

    def create
        @booking = current_event.bookings.build(booking_params)

        if @booking.save
            binding.pry
        else
        end
    end


    def show

    end

    private 
    def booking_params
        params.require(:booking).permit(
        :user_id,
        :event_id
        )
      end
end