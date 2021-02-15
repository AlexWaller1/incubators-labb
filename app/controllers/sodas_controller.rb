class SodasController < ApplicationController

    def index
        minimart = Minimart.find(minimart_id: params[:minimart_id])
        @sodas = minimart.sodas
    end

    def show
        @soda = Soda.find(params[:id])
    end

    def new
        @soda = Soda.new(params[:minimart_id])
    end

    def create
        @soda = Soda.new(soda_params)
        @soda.save
        redirect_to soda_path(@soda)
    end

    def edit
        @soda = Soda.find(params[:id])
    end

    def update
        @soda = Soda.find(params[:id])
        @soda.update(soda_params)
        redirect_to soda_path(@soda)
    end

    def delete
        @soda = Soda.find(params[:id])
        @soda.destroy
    end

    private

    params.require(:soda).permit(:name, :company, :availability, :description)

end