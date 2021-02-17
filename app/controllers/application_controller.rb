class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    rescue_from ActionController::RoutingError, with: :redirect_to_home_page
    before_action :verified_user
    helper_method :current_user

     
    
     private

    def verified_user
        redirect_to '/' unless user_is_authenticated
    end

    def user_is_authenticated
        !!current_user
    end

    def current_user
        User.find_by(id: session[:user_id]) 
    end

    def redirect_to_home_page
        redirect_to root_path
    end
end
