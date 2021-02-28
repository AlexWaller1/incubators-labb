class SkateparkController < ApplicationController

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
        @skatepark = Skatepark.find(params[:id])
        @skatepark.create
    end

    def edit
        @skatepark = Skatepark.find(params[:id])
    end

    def update
        @skatepark = Skatepark.find(params[:id])
        @skatepark.update
    end

    def destroy
        @skatepark = Skatepark.find(params[:id])
        @skatepark.destroy
    end

    private

    def skatepark_params

    end

end