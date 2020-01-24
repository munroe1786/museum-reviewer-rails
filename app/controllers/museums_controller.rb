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
end
