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
        @place.save
        redirect_to place_path(@place)
    end

    def edit
        @place = Place.find(params[:id])
    end

    def update
        @place = Place.find(params[:id])
        @place.update(place_params)
        redirect_to place_path(@place)
    end

    private

         def place_params
            params.require(:place).permit(:name)
         end

end