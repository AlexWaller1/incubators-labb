class PlacesController < ApplicationController

    def index
        hybrid = Hybrid.find(params[:hybrid_id])
        @places = hybrid.places
    end

    def show
        @place = Place.find(params[:id])
    end

    def new
        @place = Place.new(hybrid_id: params[:hybrid_id])
    end

    def create
        @place = Place.new(place_params)
       if @place.save
        redirect_to hybrid_place_path(hybrid_id: @place.hybrid_id, id: @place.id)
       else
        @error = "Must Have Place Name For Proper Submission."
        render :new
       end
    end

    def edit
        @place = Place.find(params[:id])
        if current_user == @place.hybrid.user
            render :edit
        else
            redirect_to hybrid_place_path(@place.hybrid, @place)
        end
    end

    def update
        @place = Place.find(params[:id])
        if current_user == @place.hybrid.user
         if @place.update(place_params)
          redirect_to hybrid_place_path(hybrid_id: @place.hybrid_id, id: @place.id)
         else
          render :edit
         end
        else
            redirect_to hybrid_place_path(@place.hybrid, @place)
        end
    end

    def destroy
        @place = Place.find(params[:id])
        if current_user == @place.hybrid.user
            @place.destroy
            flash[:notice] = "Place Scrubbed from Database"
            redirect_to hybrid_places_path
        else
            redirect_to hybrid_places_path
        end
    end

    private

         def place_params
            params.require(:place).permit(:name, :location, :atmosphere, :status, :image, :hybrid_id)
         end

end

