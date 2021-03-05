class SupervisorRobots < ApplicationController

    def index
        supervisor = Supervisor.find(params[:supervisor_id])
        @supervisor_robots = supervisor.supervisor_robots
    end

    def show
    end

    def new
        supervisor = Supervisor.find(params[:supervisor_id])
        @supervisor_robot = SupervisorRobot.new(supervisor: supervisor)
    end

    def create
        @supervisor_robot = SupervisorRobot.new(supervisor_robots_params)
        if @supervisor_robot.save
           redirect_to supervisor_robot_path(@supervisor_robot.supervisor)
        else
            render :edit
        end
    end

    def edit
        @supervisor_robot = SupervisorRobot.find(params[:id])
        if current_user == @supervisor_robot.supervisor.user
            render :edit
        else
            redirect_to supervisor_robot_path(@supervisor_robot.supervisor)
    end

    def update
        @supervisor_robot = SupervisorRobot.find(params[:id])
        if @supervisor_robot.update(supervisor_robots_params)
        redirect_to supervisor_robot_path(@supervisor_robot.supervisor)
        else
            render :edit
        end
    end

    def destroy
    end

    private

    def supervisor_robots_params
        params.require(:supervisor_robots).permit(:evaluation, :supervisor_id, :robot_id)
    end

end