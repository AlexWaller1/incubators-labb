class IndustryCentersController < ApplicationController

    def index
        @industry_centers = IndustryCenter.all
    end

    def show
        @industry_center = IndustryCenter.find_by(id: params[:id])
        if @industry_center
            render :show
        else
            redirect_to industry_centers_path
        end
    end

    def new
        @industry_center = IndustryCenter.new(user: current_user)
    end

    def create
        @industry_center = IndustryCenter.new(industry_center_params)
        if @industry_center.save
            redirect_to industry_center_path(@industry_center)
        else
            @error = "Industry Center Must Have Name"
            render :new
        end
    end

    def edit
        @industry_center = IndustryCenter.find(params[:id])
        if current_user == @industry_center.user
            render :edit
        else
            redirect_to industry_center_path(@industry_center)
        end
    end

    def update
        @industry_center = IndustryCenter.find(params[:id])
        redirect_if_not_industry_center
          if @industry_center.update(industry_center_params)
              redirect_to industry_center_path(@industry_center)
          else
              @error = "Industry Center Must Have Name."
              render :edit
          end
    end

    def destroy
        @industry_center = IndustryCenter.find(params[:id])
        redirect_if_not_industry_center
            @industry_center.destroy
            flash[:notice] = "Industry Center Scrubbed From Database"
            redirect_to industry_centers_path
    end

    private

    def industry_center_params
        params.require(:industry_center).permit(:name, :city, :state, :performance, :image, :future_goals, :user_id)
    end

end