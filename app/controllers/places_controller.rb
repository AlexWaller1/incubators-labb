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
        @place.save
        redirect_to hybrid_place_path(hybrid_id: @place.hybrid_id, id: @place.id)
    end

    def edit
        @place = Place.find(params[:id])
    end

    def update
        @place = Place.find(params[:id])
        if @place.update(place_params)
         redirect_to hybrid_place_path(hybrid_id: @place.hybrid_id, id: @place.id)
        else
         render :edit
        end
    end

    private

         def place_params
            params.require(:place).permit(:name, :location, :atmosphere, :status, :image, :hybrid_id)
         end

end

