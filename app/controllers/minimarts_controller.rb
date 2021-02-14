class MinimartsController < ApplicationController

    def index
        soda = Soda.find(params[:minimart_id])
        @minimarts = soda.minimarts
    end

    def show
        @minimart = Minimart.find(params[:id])
    end

    def new
        @minimart = Minimart.new(soda_id: params[:soda_id])
        
    end

    def create
        @minimart = Minimart.new(minimart_params)
        @minimart.save
        redirect_to minimart_path(@minimart)
    end

    def edit
        @minimart = Minimart.find(params[:id])
    end

    def update
        @minimart = Minimart.find(params[:id])
        @minimart.update(minimart_params)
        redirect_to minimarts_path
    end

    def delete
        @minimart = Minimart.find(params[:id])
        @minimart.destroy
    end

    private

    def minimart_params
        params.require(:minimart).permit(:name, :address, :sodamachine, :description, :soda_id)
    end


end