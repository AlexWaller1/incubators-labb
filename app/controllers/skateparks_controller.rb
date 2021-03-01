class SkateparksController < ApplicationController

    def index
        @skateparks = Skatepark.all
    end

    def show
        @skatepark = Skatepark.find_by(id: params[:id])
        if @skatepark
            render :show
        else
            redirect_to skateparks_path
        end
    end

    def new
        @skatepark = Skatepark.new(user: current_user)
    end

    def create
        @skatepark = Skatepark.new(skatepark_params)
        if @skatepark.save
            redirect_to skateparks_path
        else
            render :new
        end
    end

    def edit
        @skatepark = Skatepark.find(params[:id])
        if current_user == @skatepark.user
            render :edit
        else
            redirect_to skatepark_path(@skatepark)
        end
    end

    def update
        @skatepark = Skatepark.find(params[:id])
        redirect_if_not_skatepark
          if @skatepark.update(skatepark_params)
            redirect_to skatepark_path(@skatepark)
          else
            render :edit
          end
        
    end

    def destroy
        @skatepark = Skatepark.find(params[:id])
        redirect_if_not_skatepark
        @skatepark.destroy
        flash[:notice] = "Skatepark Scrubbed From Database"
        redirect_to skateparks_path
       
    end

    private

    def skatepark_params

        params.require(:skatepark).permit(:name, :town, :state, :specialty, :image, :user_id)

    end

end