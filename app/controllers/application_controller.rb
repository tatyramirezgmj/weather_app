class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def current_user
      @current_user ||= User.find_by(id:  session[:user_id])
    end

      helper_method :current_user

    def require_logged_in
     if current_user
       true
     else
      redirect_to root_path
    end
  end
end
