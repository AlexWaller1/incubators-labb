class HybridPlacesController < ApplicationController

    def index
        binding.pry
        @hybrid = Hybrid.find(params[:hybrid_id])
        @places = @hybrid.places
    end

    def new
        @hybrid = Hybrid.find(params[:hybrid_id])
        @hybrid_place = HybridPlace.new(hybrid: @hybrid)
    end

    def create
        
        hybrid = Hybrid.find(place_params[:hybrid_id])
        place_params[:places][:ids].each do |place_id|
            
        if hybrid.places.pluck(:id).exclude?(place_id.to_i)
            HybridPlace.create(place_id: place_id, hybrid: hybrid, address: "test")
        end
            
        end
    end

    def destroy

    end

        private

         def place_params
            params.require(:place).permit(:name, :location, :atmosphere, :status, :image, :hybrid_id, places: [ids: []])
         end


end