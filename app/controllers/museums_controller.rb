class MuseumsController < ApplicationController
    before_action :set_museum, only: [:show, :new , :create, :edit, :update, :destroy]
    before_action :authorize_museum, only: [:update, :destroy]

    def index
        if params[:search]
            @museums = Museum.where('name LIKE ?', "%#{params[:search]}%")
        else
            @museums = Museum.all
        end
    end

    def show
        
    end

    def new
        @museum = current_user.museums.build
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
        #binding.pry
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

    def museum_params
        params.require(:museum).permit(:name, :location, :search)
    end

    def authorize_museum
        redirect_back(fallback_location: museums_path) unless @museum.user == current_user
    end
end
