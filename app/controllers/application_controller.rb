class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :current_property, :current_event, :logged_in?


  private

    def current_user
        current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def current_property
        current_property ||= Property.find_by(id: session[:user_id]) if session[:user_id]
    end

    def current_event
        current_event ||= Event.find_by(id: session[:user_id]) if session[:user_id]
    end



    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_loggedin
        redirect_to '/' if !logged_in?
    end

    


    
end
