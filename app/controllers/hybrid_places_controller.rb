class HybridPlacesController < ApplicationController

    def index
        
        @hybrid = Hybrid.find(params[:hybrid_id])
        @hybrid_places = @hybrid.hybrid_places
    end

    def new
        hybrid = Hybrid.find(params[:hybrid_id])
        @hybrid_place = HybridPlace.new(hybrid: hybrid)
    end

    def create
        
        @hybrid_place = HybridPlace.new(hybrid_place_params)
        if @hybrid_place.save
            redirect_to hybrid_places_path(@hybrid_place.hybrid_id)
        else
            @error = "Place Must Have Address."
             render :new
        end
        
    end

    def destroy
        hybrid_place = HybridPlace.find(params[:id])
        hybrid = hybrid_place.hybrid
        hybrid_place.destroy
        redirect_to hybrid_places_path(hybrid)


    end

        private

         def hybrid_place_params
            params.require(:hybrid_place).permit(:hybrid_id, :place_id, :address)
         end


end