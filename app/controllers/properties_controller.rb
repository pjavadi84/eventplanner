class PropertiesController < ApplicationController
    def index 
        @properties = Property.all
    end
    
    def new 
        @property = Property.new
    end

    def create 
        @property = current_user.properties.build(property_params)

        if @property.save
            # binding.pry
            redirect_to user_properties_path(@property)
        else
            render :new
        end
        
          
    end

    def show
        @property = Property.find(params[:id])
    end

    def edit

    end

    def update

    end

    private 
    def property_params
        params.require(:property).permit(
            :user_id,
            :event_type, 
            :date_created, 
            :maximum_occupancy, 
            :address, 
            :city, 
            :state, 
            :zipcode)
    end
end