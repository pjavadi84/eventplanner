class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
        if @user.save
            #log them in
            session[:user_id] = @user.id
            #redirect to showpage
            redirect_to @user
        else
            render :new
        end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:fullname, :email, :password, :host)
  end
end
