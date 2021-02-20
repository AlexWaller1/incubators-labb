class PlacesController < ApplicationController

    def index

        @places = Place.all
        
    end

    def show
        @place = Place.find_by(id: params[:id])
        @hybrid_places = HybridPlace.where(place: @place)
        if @place
            render :show
        else
            redirect_to places_path
        end
    end

    def new
        @place = Place.new
    end

    def create
        @place = Place.new(place_params.merge(user: current_user))
        if @place.save
        redirect_to place_path(@place)
        else
            @error = "Place Must Have A Name Entered."
            render :new
        end
        
        
    end

    def edit
         @place = Place.find(params[:id])
          if current_user == @place.user
           render :edit
         else
            redirect_to place_path(@place)
         end
        
    end

    def update
        @place = Place.find(params[:id])
        if current_user == @place.user
         if @place.update(place_params)
          redirect_to place_path(@place.id)
         else
          @error = "Place Must Have Name Entered."
          render :edit
         end
        else
            redirect_to places_path
        end
        
    end

    def destroy
        @place = Place.find(params[:id])
           if current_user == @place.user
            @place.destroy
            flash[:notice] = "Place Scrubbed from Database"
            redirect_to places_path
           else
            redirect_to place_path(@place)
           end
        
    end

    private

         def place_params
            params.require(:place).permit(:name, :location, :atmosphere, :status, :image, :hybrid_id, places: [ids: []])
         end

end

