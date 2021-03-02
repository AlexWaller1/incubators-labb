class RobotsController < ApplicationController

    def index
        @robots = Robot.all
    end

    def show
        @robot = Robot.find_by(id: params[:id])
        if @robot
            render :show
        else
            redirect_to robots_path
        end
    end

    def new
        @robot = Robot.new(user: current_user)
    end

    def create
        @robot = Robot.new(robot_params)
        if @robot.save
        redirect_to robot_path(@robot)
        else
            @error = "Robot Must Have A Name"
            render :new
        end
    end

    def edit
        @robot = Robot.find(params[:id])
        if current_user == @robot.user
            render :edit
        else
            redirect_to robot_path(@robot)
        end
    end

    def update
        @robot = Robot.find(params[:id])
        if current_user == @robot.user
          if @robot.update(robot_params)
            redirect_to robot_path(@robot)
          else
            @error = "Robot Must Have Name"
            render :edit
          end
        else
            redirect_to robot_path(@path)
        end

    end

    def destroy
        @robot = Robot.find(params[:id])
        if current_user == @robot.user
           @robot.destroy
           flash[:notice] = "Robot Scrubbed From Database"
           redirect_to robots_path
        else
           redirect_to robots_path
        end
    end

    private

    def robot_params
        params.require(:robot).permit(:name, :model, :function, :personality, :image, :biography, :user_id)
    end

end