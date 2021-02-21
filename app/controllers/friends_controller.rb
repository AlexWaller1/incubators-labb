class FriendsController < ApplicationController

    def index
        hybrid = Hybrid.find(params[:hybrid_id])
        @friends = hybrid.friends
    end

    def show
        @friend = Friend.find_by(id: params[:id])
        if @friend
            render :show
        else
            redirect_to hybrid_friends_path
        end

    end

    def new
        @friend = Friend.new(hybrid_id: params[:hybrid_id])
    end

    def create
        @friend = Friend.new(friend_params)
        #binding.pry
       if @friend.save
        redirect_to hybrid_friend_path(hybrid_id: @friend.hybrid_id, id: @friend.id)
       else
        @error = "Hybrid's Friend Must Have Name Entered."
        render :new
       end
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
        redirect_if_not_friend
         if @friend.update(friend_params)
          redirect_to hybrid_friend_path(hybrid_id: @friend.hybrid_id, id: @friend.id)
         else
         @error = "Hybrid's Friend Must Have Name Entered."
         render :edit
         end
        
    end

    def destroy
        @friend = Friend.find(params[:id])
        redirect_if_not_friend
          @friend.destroy
          flash[:notice] = "Friend Scrubbed from Database"
          redirect_to hybrid_friends_path
        
    end

    private

         def friend_params
            params.require(:friend).permit(:name, :species, :personality, :biography, :image, :hybrid_id)
         end
end