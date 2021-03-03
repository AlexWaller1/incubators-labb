class SupervisorsController < ApplicationController

def index
    @supervisors = Supervisor.all
end

def show
    @supervisor = Supervisor.find_by(id: params[:id])
end

def new
    @supervisor = Supervisor.new(user: current_user)
end

def create
    @supervisor = Supervisor.new(supervisor_params)
    if @supervisor.save
        redirect_to supervisor_path(@supervisor)
    else
        render :new
    end
end

def edit
    @supervisor = Supervisor.find(params[:id])
end

def update
    @supervisor = Supervisor.find(params[:id])
    if @supervisor.update(supervisor_params)
        redirect_to supervisor_path(@supervisor)
    else
        render :edit
    end
end

def destroy
    @supervisor = Supervisor.find(param[:id])
    @supervisor.destroy
end

private

def supervisor_params
      params.require(:supervisor).permit(:name, :image, :experience, :biography, :user_id)
end

end