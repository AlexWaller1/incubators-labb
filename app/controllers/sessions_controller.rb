class SessionsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create, :login]

    

    def new
        @user = User.new
    end


    def create
        @user = User.find_by(username:user_params[:username])
        #binding.pry
        if !@user || user_params.empty?
            @error = "I'm sorry, that username is not on file."
            render :new
        elsif !@user.authenticate(user_params[:password])
            @error = "I'm sorry, that password is not on file."
            render :new
        else
            session[:user_id] = @user.id
            redirect_to hybrids_path
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

   



    private

    

    def user_params
        params.require(:user).permit(:username, :password)
    end
    
end
