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
    end

    def update
        @friend = Friend.find(params[:id])
        if @friend.update(friend_params)
         redirect_to friend_path(@friend)
        else
         render :edit
        end
    end

    private

         def friend_params
            params.require(:friend).permit(:name, :species, :personality, :biography, :image, :hybrid_id)
         end
end