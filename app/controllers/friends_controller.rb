class FriendsController < ApplicationController

    def index
        hybrid = Hybrid.find(params[:hybrid_id])
        @friends = hybrid.friends
    end

    def show
        @friend = Friend.find(params[:id])
    end

    def new
        @friend = Friend.new(hybrid_id: params[:hybrid_id])
    end

    def create
        @friend = Friend.new(friend_params)
        #binding.pry
        @friend.save
        redirect_to hybrid_friend_path(hybrid_id: @friend.hybrid_id, id: @friend.id)
    end

    def edit
        @friend = Friend.find(params[:id])
        if current_user == @friend.hybrid.user
            render :edit
        else
            redirect_to hybrid_friend_path(@friend.hybrid, @friend)
        end
    end

    def update
        @friend = Friend.find(params[:id])
        if current_user == @friend.hybrid.user
         if @friend.update(friend_params)
          redirect_to hybrid_friend_path(hybrid_id: @friend.hybrid_id, id: @friend.id)
         else
         render :edit
         end
        else
            redirect_to hybrid_friend_path(@friend.hybrid, @friend)
        end
    end

    def destroy
        @friend = Friend.find(params[:id])
        if current_user == @friend.hybrid.user
          @friend.destroy
          flash[:notice] = "Friend Scrubbed from Database"
          redirect_to hybrid_friends_path
        else
          redirect_to hybrid_friends_path
        end
    end

    private

         def friend_params
            params.require(:friend).permit(:name, :species, :personality, :biography, :image, :hybrid_id)
         end
end