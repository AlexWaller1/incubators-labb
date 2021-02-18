class PlacesController < ApplicationController

    def index

        @places = Place.all
        
    end

    def show
        @place = Place.find(params[:id])
    end

    def new
        @place = Place.new
    end

    def create
        @place = Place.new(place_params)
        if @place.save
        redirect_to place_path(@place)
        else
            @error = "Place Must Have A Name Entered."
            render :new
        end
        
        
    end

    def edit
        @place = Place.find(params[:id])
        
            render :edit
        
    end

    def update
        @place = Place.find(params[:id])
        
         if @place.update(place_params)
          redirect_to place_path(@place.id)
         else
          @error = "Place Must Have Name Entered."
          render :edit
         end
        
    end

    def destroy
        @place = Place.find(params[:id])
        
            @place.destroy
            flash[:notice] = "Place Scrubbed from Database"
            redirect_to places_path
        
    end

    private

         def place_params
            params.require(:place).permit(:name, :location, :atmosphere, :status, :image, :hybrid_id, places: [ids: []])
         end

end

