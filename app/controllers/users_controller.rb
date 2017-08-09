class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user= User.new(allowed_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path, notice: 'You have succesfully sign up.'
    else
      flash[:notice] = "Please check that your passwords match."
      render :new
    end
  end

  private
  def allowed_params
    params.require(:user).permit(:name, :email, :password, :password_digest, :password_confirmation)
  end
end
