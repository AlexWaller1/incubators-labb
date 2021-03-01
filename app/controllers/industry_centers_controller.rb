class IndustryCentersController < ApplicationController

    def index
        @industry_centers = IndustryCenter.all
    end

    def show
        @industry_center = IndustryCenter.find_by(id: params[:id])
    end

    def new
        @industry_center = IndustryCenter.new(user: current_user)
    end

    def create
        @industry_center = IndustryCenter.new(industry_center_params)
        @industry_center.save
    end

    def edit
        @industry_center = IndustryCenter.find(params[:id])
    end

    def update
        @industry_center = IndustryCenter.find(params[:id])
        @industry.update(industry_center_params)
    end

    def destroy
        @industry_center = IndustryCenter.find(params[:id])
        @industry_center.destroy
    end

    private

    def industry_center_params
        params.require(:industry_center).require(:name, :city, :state, :performance, :image, :future_goals, :user_id)
    end

end