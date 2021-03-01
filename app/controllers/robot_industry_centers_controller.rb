class RobotIndustryCenters < ApplicationController

    def index
        @robots = Robot.all
    end

    def show
        @robot = Robot.find_by(id: params[:id])
    end

    def new
        @robot = Robot.new(user: current_user)
    end

    def create
        @robot = Robot.new(robot_params)
        @robot.save
    end

    def edit
        @robot = Robot.find(params[:id])
    end

    def update
        @robot = Robot.find(params[:id])
        @robot.update
    end

    def destroy
        @robot = Robot.find(params[:id])
        @robot.destroy
    end

    private

    def robots_industry_centers_params
        params.require(:robot).permit(:name, :model, :function, :personality, :image, :biography, :user_id)
    end
end