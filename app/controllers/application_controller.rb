class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :verified_user
    helper_method :current_user


  private

    def verified_user
        redirect_to '/' unless logged_in?
    end

    def logged_in?
        !!session[:user_id]
    end


    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
end
