class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create, :signup]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        #binding.pry
        if @user.save
            session[:user_id] = @user.id
            redirect_to hybrids_path
        else
            @error = "Invalid Credentials"
            render :new
        end
    end

    

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end