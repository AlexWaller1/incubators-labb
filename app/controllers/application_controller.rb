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

    def redirect_if_not_hybrid
        if current_user == @hybrid.user
        else
            redirect_to hybrids_path
        end
    end

    def redirect_if_not_motorhome
        if current_user == @motorhome.hybrid.user
        else
            redirect_to hybrid_motorhomes_path
        end
    end

    def redirect_if_not_friend
        if current_user == @friend.hybrid.user
        else
           redirect_to hybrid_friends_path
        end
    end

    def redirect_if_not_place
        if current_user == @place.user
        else
            redirect_to places_path
        end
    end

    def redirect_if_not_hybrid_place
        if current_user == @hybrid_place.hybrid.user
        else
            redirect_to hybrid_places_path
        end
    end
end
