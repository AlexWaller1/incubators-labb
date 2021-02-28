class SkateparksController < ApplicationController

    def index
        @skateparks = Skatepark.all
    end

    def show
        @skatepark = Skatepark.find_by(id: params[:id])
    end

    def new
        @skatepark = Skatepark.new(user: current_user)
    end

    def create
        @skatepark = Skatepark.new(skatepark_params)
        if @skatepark.save
            redirect_to skateparks_path
        else
            render :new
        end
    end

    def edit
        @skatepark = Skatepark.find(params[:id])
    end

    def update
        @skatepark = Skatepark.find(params[:id])
        if @skatepark.update
            redirect_to skatepark_path(@skatepark)
        else
            render :edit
        end
    end

    def destroy
        @skatepark = Skatepark.find(params[:id])
        @skatepark.destroy
        redirect_to skatepark_path
    end

    private

    def skatepark_params

        params.require(:skatepark).permit(:name, :town, :state, :specialty, :user_id)

    end

end