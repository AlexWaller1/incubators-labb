class MinimartsController < ApplicationController

    def index
        @minimarts = Minimart.all
    end

    def show
        @minimart = Minimart.find_by(id: params[:id])
        @hybrid_minimarts = HybridMinimart.where(minimart: @minimart)
        if @minimart
            render :show
        else 
            redirect_to minimarts_path
        end
    end

    def new
        @minimart = Minimart.new(user: current_user)
    end

    def create
        @minimart = Minimart.new(minimart_params)
        if @minimart.save
        redirect_to minimart_path(@minimart)
        else
            render :new
        end

    end

    def edit
        @minimart = Minimart.find(params[:id])
        if current_user == @minimart.user
            render :edit
        else
            redirect_to minimart_path(@minimart)
        end
        
    end

    def update
        @minimart = Minimart.find(params[:id])
        if_not_minimart
          if @minimart.update(minimart_params)
          redirect_to minimart_path(@minimart)
          else
          render :edit
          end
        
    end

    def destroy
        @minimart = Minimart.find(params[:id])
        if_not_minimart
        @minimart.destroy
        redirect_to minimarts_path
        
    end

    def state
        @minimarts = Minimart.where(state: params[:state])
        render :index
    end

    private

    def minimart_params
        params.require(:minimart).permit(:name, :address, :sodamachine, :description, :state, :image, :user_id)
    end
end