class MotorhomesController < ApplicationController

    def index
        hybrid = Hybrid.find(params[:hybrid_id])
        @motorhomes = hybrid.motorhomes
    end

    def show
        @motorhome = Motorhome.find(params[:id])
    end

    def new
        @motorhome = Motorhome.new(hybrid_id: params[:hybrid_id])
    end

    def create
        @motorhome = Motorhome.new(motorhome_params)
        @motorhome.save
        redirect_to hybrid_motorhome_path(hybrid_id: @motorhome.hybrid_id, id: @motorhome.id)
    end

    def edit
        @motorhome = Motorhome.find(params[:id])
        if current_user == @motorhome.hybrid.user
            render :edit
        else
            redirect_to hybrid_motorhome_path(@motorhome.hybrid, @motorhome)
        end
    end

    def update
        @motorhome = Motorhome.find(params[:id])
        if current_user == @motorhome.hybrid.user
         if @motorhome.update(motorhome_params)
          redirect_to hybrid_motorhome_path(hybrid_id: @motorhome.hybrid_id, id: @motorhome.id)
        else
         render :edit
        end
       else
        redirect_to hybrid_motorhome_path(@motorhome.hybrid, @motorhome)
       end
    end

    def destroy
        @motorhome = Motorhome.find(params[:id])
        if current_user == @motorhome.hybrid.user
            @motorhome.destroy
            flash[:notice] = "Motorhome Scrubbed from Database"
            redirect_to hybrid_motorhomes_path
        else
            redirect_to hybrid_motorhomes_path
        end
    end

    private

         def motorhome_params
            params.require(:motorhome).permit(:model, :image, :year, :features, :mileage, :history, :hybrid_id)
         end

end

#check back to validations-in-controller-actions-rails-labs 
#for other private method to take care of repetitve code