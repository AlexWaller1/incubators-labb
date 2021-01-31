class HybridsController < ApplicationController

    def index
        @hybrids = Hybrid.all
    end

    def show
        @hybrid = Hybrid.find(params[:id])
    end

    def new
        @hybrid = Hybrid.new
    end

    def create
        @hybrid = Hybrid.new(hybrid_params)
        @hybrid.save
        redirect_to hybrid_path(@hybrid)
    end

    def edit
        @hybrid = Hybrid.find(params[:id])
    end

    def update
        @hybrid = Hybrid.find(params[:id])
        @hybrid.update(hybrid_params)
        redirect_to hybrid_path(@hybrid)
    end

    private

         def hybrid_params
            params.require(:hybrid).permit(:name)
         end

end