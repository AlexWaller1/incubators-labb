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
        @place = Place.new(user: current_user)
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
          if current_user == @place.user
           render :edit
         else
            redirect_to place_path(@place)
         end
        
    end

    def update
        @place = Place.find(params[:id])
        redirect_if_not_place
         if @place.update(place_params)
          redirect_to place_path(@place.id)
         else
          @error = "Place Must Have Name Entered."
          render :edit
         end
        
    end

    def location
        
        place = Place.find_by(location: params[:location])
        redirect_to place_path(place)
    end

    def destroy
        @place = Place.find(params[:id])
        redirect_if_not_place
            @place.destroy
            flash[:notice] = "Place Scrubbed from Database"
            redirect_to places_path
           
        
    end

    private

         def place_params
            params.require(:place).permit(:name, :location, :atmosphere, :status, :image, :user_id)
         end

end

