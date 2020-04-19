class PropertiesController < ApplicationController
    def index 
        @properties = Property.all.orderedname
    end
    
    def new 
        if params[:user_id] && !User.exists?(params[:user_id])
            redirect_to users_path, alert: "User not found."
        else
            @property = Property.new(user_id: params[:user_id])
        end     
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
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            if user.nil?
                redirect_to users_path, alert: "User not found."
            else
                @property = user.properties.find_by(id: params[:id])
                redirect_to user_properties_path(user), alert: "Property not found." if @property.nil?
            end
        else
            @property = Property.find(params[:id])
        end
        
    end

    def update
        @property = Property.find(params[:id])
        @property.update(property_params)
        redirect_to user_property_path(@property)
    end

    def destroy 
        @property = Property.find(params[:id])
        @property.destroy
        flash[:notice]= "Property deleted."
        redirect_to user_properties_path(@property)
    end

    private 
    def property_params
        params.require(:property).permit(
            :user_id,
            :property_name,
            :event_type, 
            :date_created, 
            :maximum_occupancy, 
            :address, 
            :city, 
            :state, 
            :zipcode)
    end
end