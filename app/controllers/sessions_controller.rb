class SessionsController < ApplicationController
    # skip_before_action :current_user, only: [:new, :create]
    

    def new
    end

    def create 
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "login faild! please try again"
            redirect_to "/login"
        end
    end

    def destroy
        session.clear
        redirect_to '/'
    end
end