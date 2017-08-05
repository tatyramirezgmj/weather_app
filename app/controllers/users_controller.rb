class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user= User.new(allowed_params)
    if @user.save
      redirect_to root_path, notice: 'Created user'
    else
      render :new
    end
  end


  private
  def allowed_params
    params.require(:user).permit(:name, :email, :password_digest)
  end
end
