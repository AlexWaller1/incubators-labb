class HybridsController < ApplicationController

    def index
        @hybrids = Hybrid.all
    end

    def show
        @hybrid = Hybrid.find(params[:id])
    end

    def new
        @hybrid = Hybrid.new(user: current_user)
    end

    def create
        @hybrid = Hybrid.new(hybrid_params)
        #binding.pry
       if @hybrid.save
        redirect_to hybrid_path(@hybrid)
       else
        render :new
       end
    end

    def edit
        @hybrid = Hybrid.find(params[:id])
    end

    def update
        @hybrid = Hybrid.find(params[:id])
        if @hybrid.update(hybrid_params)
         redirect_to hybrid_path(@hybrid)
        else
         render :edit
        end
    end

    def destroy
        @hybrid = Hybrid.find(params[:id])
        @hybrid.destroy
        flash[:notice] = "Hybrid Deleted"
        redirect_to hybrids_path
    end


    private

         def hybrid_params
            params.require(:hybrid).permit(:name, :species, :personality, :biography, :image, :user_id)
         end

end