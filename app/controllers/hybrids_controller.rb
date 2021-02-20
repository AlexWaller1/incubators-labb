class HybridsController < ApplicationController

    def index
        @hybrids = Hybrid.all
    end

    def show
        
        @hybrid = Hybrid.find_by(id: params[:id])
        @hybrids = Hybrid.ram_hybrids
        @trees = Hybrid.tree_hybrids
        @trout = Hybrid.trout_hybrids
        
        if @hybrid
            render :show
        else
            redirect_to hybrids_path
        end
    end

    def new
        @hybrid = Hybrid.new(user: current_user)
    end

    def create
       @hybrid = Hybrid.new(hybrid_params)
        #binding.pry
       if @hybrid.save
        redirect_to hybrid_path(@hybrid)
       else
        @error = "Hybrid Must Have Name Entered."
        render :new
       end
    end

    def edit
        
        @hybrid = Hybrid.find(params[:id])
        if current_user == @hybrid.user
            render :edit
        else
            redirect_to hybrid_path(@hybrid)
        end
    end

    def update
        @hybrid = Hybrid.find(params[:id])
        if current_user == @hybrid.user
         if @hybrid.update(hybrid_params)
          redirect_to hybrid_path(@hybrid)
         else
          @error = "Hybrid Name Must Be Entered."
          render :edit
        end
        else
          redirect_to hybrids_path
        end
    end

    def destroy
        @hybrid = Hybrid.find(params[:id])
        if current_user == @hybrid.user
          @hybrid.destroy
          flash[:notice] = "Hybrid Scrubbed from Database"
          redirect_to hybrids_path
        else
          redirect_to hybrids_path
        end
    end


    private

         def hybrid_params
            params.require(:hybrid).permit(:name, :species, :personality, :biography, :image, :user_id)
         end

end