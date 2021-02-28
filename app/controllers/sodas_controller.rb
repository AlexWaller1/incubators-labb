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
        @error = "Name of Soda Must Be Entered"
        render :new
        end
    end

    def edit
        @soda = Soda.find(params[:id])
        if current_user == @soda.minimart.user
            render :edit
        else
            redirect_to minimart_soda_path(@soda.minimart, @soda)
        end
    end

    def update
        @soda = Soda.find(params[:id])
        redirect_if_not_soda
          if @soda.update(soda_params)
             redirect_to minimart_sodas_path(@soda.minimart, @soda)
          else
             @error = "Name of Soda Must Be Entered"
             render :edit
          end
        
    end

    def destroy
        @soda = Soda.find(params[:id])
        redirect_if_not_soda
        @soda.destroy
        flash[:notice] = "Soda Scrubbed From Database"
        redirect_to minimart_sodas_path
        
    end

    private

    def soda_params
        params.require(:soda).permit(:name, :company, :availability, :description, :image, :minimart_id)
    end


end