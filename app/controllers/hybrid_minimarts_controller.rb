class HybridMinimartsController < ApplicationController

    def index
        hybrid = Hybrid.find(params[:hybrid_id])
        @hybrid_minimarts = hybrid.hybrid_minimarts
    end

    def show
        @hybrid_minimart = HybridMinimart.find_by(id: params[:id])
        if @hybrid_minimart
            render :show
        else
            redirect_to hybrid_minimarts_path
        end
    end

    def new
        hybrid = Hybrid.find(params[:hybrid_id])
        @hybrid_minimart = HybridMinimart.new(hybrid: hybrid)
    end

    def create
        @hybrid_minimart = HybridMinimart.new(hybrid_minimart_params)
        if @hybrid_minimart.save
            redirect_to hybrid_minimart_path(@hybrid_minimart.hybrid)
        else
            render :new
        end
    end

    def edit
        @hybrid_minimart = HybridMinimart.find(params[:id])
        if current_user == @hybrid_minimart.hybrid.user
            render :edit
        else
            redirect_to hybrid_minimart_path(@hybrid_minimart.hybrid)
        end
    end

    def update
        @hybrid_minimart = HybridMinimart.find(params[:id])
        if @hybrid_minimart.update(hybrid_minimart_params)
        redirect_to hybrid_minimarts_path(@hybrid_minimart.hybrid)
        else
            render :edit
        end
    end

    def destroy
        @hybrid_minimart = HybridMinimart.find(params[:id])
        @hybrid_minimart.destroy
    end

    private

    def hybrid_minimart_params
        params.require(:hybrid_minimart).permit(:hybrid_id, :minimart_id, :visit_log)
    end

end