class HybridPlacesController < ApplicationController

    def index
        
        @hybrid = Hybrid.find(params[:hybrid_id])
        @hybrid_places = @hybrid.hybrid_places
    end

    def show
        @hybrid_place = HybridPlace.find_by(id: params[:id])
          if @hybrid_place
            redirect_to edit_hybrid_place_path
          else
            redirect_to edit_hybrid_place_path
          end
        
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

    def edit
        
        @hybrid_place = HybridPlace.find_by(id: params[:id])
        if @hybrid_place
          if current_user == @hybrid_place.hybrid.user
            render :edit
         else
            redirect_to hybrid_places_path
         end
        else
            redirect_to hybrid_places_path
        end
        

    end

    def update
        @hybrid_place = HybridPlace.find(params[:id])
        if current_user == @hybrid_place.hybrid.user
         if @hybrid_place.update(hybrid_place_params)
            redirect_to hybrid_places_path(@hybrid_place.hybrid_id)
         else
            @error = "Place Must Have Address Entered."
            render :edit
         end
        else
            redirect_to hybrid_places_path
        end

    end

    def destroy
        hybrid_place = HybridPlace.find(params[:id])
        hybrid = hybrid_place.hybrid
        if current_user == @hybrid_place.hybrid.user
           hybrid_place.destroy
           redirect_to hybrid_places_path(hybrid)
        else
            render :index
        end


    end

        private

         def hybrid_place_params
            params.require(:hybrid_place).permit(:hybrid_id, :place_id, :address)
         end


end