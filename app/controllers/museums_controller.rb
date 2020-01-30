class MuseumsController < ApplicationController
    before_action :set_museum, only: [:show, :edit, :update, :destroy]
    before_action :set_user

    def index
        if @user
            @museums = @user.museums
        else
            @museums = Museum.all
        end
    end

    def show
        
    end

    def new
        if @user
            @museum = @user.museums.build
        else
            @museum = Museum.new
        end
    end

    def create
        @museum = current_user.museums.build(museum_params)
        if @museum.save
            flash[:success] = "Museum sucessfully created"
            redirect_to museums_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @museum.update(museum_params)
            redirect_to museum_path(@museum)
            flash[:success] = "Museum successfully updated"
        else
            render :edit
        end
    end

    def destroy
        if @museum.destroy
            redirect_to museums_path
            flash[:success] = "Museum successfully deleted"
        end
    end

    private

    def set_museum
        @museum = Museum.find_by_id(params[:id])
    end 

    def set_user
        @user = User.find_by_id(params[:user_id])
    end

    def museum_params
        params.require(:museum).permit(:user_id, :name, :location)
    end
end
