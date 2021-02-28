class SkateboarderController < ApplicationController

    def index
        skatepark = Skatepark.find(params[:skatepark_id])
        @skateboarders = skatepark.skateboarders
    end

    def show
        @skateboarder = Skateboarder.find(params[:id])
    end

    def new
        @skateboarder = Skateboarder.new(skatepark_id: params[:skatepark_id])
    end

    def create
        @skateboarder = Skateboarder.new(skateboarder_params)
        if @skateboarder.save
            redirect to skatepark_skateboarders_path(@skateboarder.skatepark, @skateboarder)
        else
            render :new
        end
    end

    def edit
        @skateboarder = Skateboarder.find(params[:id])
    end

    def update
        @skateboarder = Skateboarder.find(params[:id])
        if @skateboarder.update
            redirect_to skatepark_skateboarders_path(@skateboarder.skatepark, @skateboarder)
        else
            render :edit
    end

    def destroy
        @skateboarder = Skateboarder.find(params[:id])
        @skateboarder.destroy
        redirect_to skatepark_skateboarders_path
    end

    private

    def skateboarder_params
        params.require(:skateboarder).permit(:name, :experience, :favorite_spots, :skatepark_id)
    end

end