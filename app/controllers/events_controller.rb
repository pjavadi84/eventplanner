class EventsController < ApplicationController
    def index 
        @events = Event.all
    end

    def new
        if params[:property_id] && !Property.exists?(params[:property_id])
            redirect_to properties_path, alert: "Property not found."
        else
            @event = Event.new(property_id: params[:property_id])
        end    
    end

    def create 

    end

    def edit

    end

    def update 

    end

    def destroy

    end

    private 
    def event_params
        params.require(:event).permit(
            :property_id,
            :event_name,
            :ticket_price,
            :minimum_age,
            :event_type,
            :number_of_guests,
            :event_date
        )
    end
    
end