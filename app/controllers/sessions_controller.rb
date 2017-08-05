class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

    return render action: 'new' unless @user

    #logged in
    session[:user_id] = @user.id
    redirect_to weather_path
  end
end
