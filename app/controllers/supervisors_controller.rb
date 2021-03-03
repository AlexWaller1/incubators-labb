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
    if current_user == @supervisor.user
        render :edit
    else
        redirect_to supervisor_path(@supervisor)
    end
end

def update
    @supervisor = Supervisor.find(params[:id])
    redirect_if_not_supervisor
      if @supervisor.update(supervisor_params)
          redirect_to supervisor_path(@supervisor)
      else
          render :edit
      end
   
end

def destroy
    @supervisor = Supervisor.find(params[:id])
    redirect_if_not_supervisor
      @supervisor.destroy
      redirect_to supervisors_path
    
end

private

def supervisor_params
      params.require(:supervisor).permit(:name, :image, :experience, :biography, :user_id)
end

end