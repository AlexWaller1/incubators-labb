class SodasController < ApplicationController
    def index
        minimart = Minimart.find(params[:minimart_id])
        @sodas = minimart.sodas
    end

    def show
        @soda = Soda.find_by(id: params[:id])
    end

    def new
        @soda = Soda.new(minimart_id: params[:minimart_id])
    end

    def create
        @soda = Soda.new(soda_params)
        if @soda.save
        redirect_to minimart_sodas_path(@soda.minimart, @soda)
        else
        render :new
        end
    end

    def edit
        @soda = Soda.find(params[:id])
    end

    def update
        @soda = Soda.find(params[:id])
        if @soda.update(soda_params)
        redirect_to minimart_sodas_path(@soda.minimart, @soda)
        else
            render :edit
        end
    end

    def destroy
        @soda = Soda.find(params[:id])
        @soda.destroy
        redirect_to minimart_sodas_path
    end

    private

    def soda_params
        params.require(:soda).permit(:name, :company, :availability, :description, :image, :minimart_id)
    end


end