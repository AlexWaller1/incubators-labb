class HybridMinimartsController < ApplicationController

    def index
        hybrid = Hybrid.find(params[:hybrid_id])
        @hybrid_minimarts = hybrid.hybrid_minimarts
    end

    def show
        @hybrid_minimart = HybridMinimart.find_by(id: params[:id])
    end

    def new
        hybrid = Hybrid.find(params[:hybrid_id])
        @hybrid_minimart = HybridMinimart.new(hybrid: hybrid)
    end

    def create
        @hybrid_minimart = HybridMinimart.new(hybrid_minimart_params)
        @hybrid_minimart.save
    end

    def edit
        @hybrid_minimart = HybridMinimart.find(params[:id])
    end

    def update
        @hybrid_minimart = HybridMinimart.find(params[:id])
        @hybrid_minimart.update
        redirect_to hybrid_minimarts_path
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