class MotorhomesController < ApplicationController

    def index
        @motorhomes = Motorhome.all
    end

    def show
        @motorhome = Motorhome.find(params[:id])
    end

    def new
        @motorhome = Motorhome.new
    end

    def create
        @motorhome = Motorhome.new(motorhome_params)
        @motorhome.save
        redirect_to motorhome_path(@motorhome)
    end

    def edit
        @motorhome = Motorhome.find(params[:id])
    end

    def update
        @motorhome = Motorhome.find(params[:id])
        if @motorhome.update(motorhome_params)
         redirect_to motorhome_path(@motorhome)
        else
         render :edit
        end
    end

    private

         def motorhome_params
            params.require(:motorhome).permit(:model)
         end

end

#check back to validations-in-controller-actions-rails-labs 
#for other private method to take care of repetitve code