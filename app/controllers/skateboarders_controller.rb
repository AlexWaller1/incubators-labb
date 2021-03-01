class SkateboardersController < ApplicationController

    def index
        skatepark = Skatepark.find(params[:skatepark_id])
        @skateboarders = skatepark.skateboarders
    end

    def show
        @skateboarder = Skateboarder.find(params[:id])
        if @skateboarder
            render :show
        else
            redirect_to skatepark_skateboarders_path
        end
    end

    def new
        @skateboarder = Skateboarder.new(skatepark_id: params[:skatepark_id])
    end

    def create
        @skateboarder = Skateboarder.new(skateboarder_params)
        if @skateboarder.save
            redirect_to skatepark_skateboarder_path(@skateboarder.skatepark, @skateboarder)
        else
            render :new
        end
    end

    def edit
        @skateboarder = Skateboarder.find(params[:id])
        if current_user == @skateboarder.skatepark.user
            render :edit
        else
            redirect_to skatepark_skateboarder_path(@skateboarder.skatepark, @skateboarder)
        end
    end

    def update
        @skateboarder = Skateboarder.find(params[:id])
        redirect_if_not_skateboarder
          if @skateboarder.update(skateboarder_params)
            redirect_to skatepark_skateboarder_path(@skateboarder.skatepark, @skateboarder)
          else
            render :edit
          end
        
    end

    def destroy
        @skateboarder = Skateboarder.find(params[:id])
        redirect_if_not_skateboarder
        @skateboarder.destroy
        flash[:notice] = "Skateboarder Scrubbed From Database"
        redirect_to skatepark_skateboarders_path
        
    end

    private

    def skateboarder_params
        params.require(:skateboarder).permit(:name, :experience, :favorite_spots, :image, :skatepark_id)
    end

end