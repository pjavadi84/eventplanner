class PropertiesController < ApplicationController
    def index 
        @properties = Property.all
    end
    
    def new 
        @property = Property.new
    end

    def create 
        
    end

    def show
        
    end

    def edit

    end

    def update

    end

    private 
    def property_params
        params.require(:property).permit(
            :event_type, 
            :date_created, 
            :maximum_occupancy, 
            :address, 
            :city, 
            :state, 
            :zipcode)
    end
end