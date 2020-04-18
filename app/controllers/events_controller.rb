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
        @event = current_property.events.build(event_params)
        if @event.save
            redirect_to property_events_path(@event)
        else
            render :new
        end
    end

    def show
        @event = Event.find(params[:id])
    end

    def edit
        if params[:property_id]
            property = Property.find_by(id: params[:property_id])
            if property.nil?
                redirect_to properties_path, alert: "property not found"
            else
                @event = property.events.find_by(id: params[:id])
                redirect_to property_events_path(property), alert: "Event not found." if @event.nil?
            end
        else
            @event = Event.find(params[:id])
        end
    end

    def update 
        @event = Event.find(params[:id])
        @event.update(event_params)
        redirect_to property_event_path(@event)
    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy
        flash[:notice] = "Event deleted"
        redirect_to property_events_path(@event)
    end

    private 
    def event_params
        params.require(:event).permit(
            :property_id,
            :event_name,
            :ticket_price,
            :minimum_age,
            :number_of_guests,
            :event_date
        )
    end
    
end