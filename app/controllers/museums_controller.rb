class MuseumsController < ApplicationController
    before_action :set_museum, only: [:show, :edit, :update, :destroy]

    def index
        @museums = Museum.all
    end

    def show
        
    end

    def new
        @museum = Museum.new
    end

    def create
        @museum = Museum.new(museum_params)
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
        if @museum.users == current_user
            @museum.update(museum_params)
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
        @museum = Museum.find_by(id: params[:id])
    end 

    def museum_params
        params.require(:museum).permit(:name, :location)
    end
end
