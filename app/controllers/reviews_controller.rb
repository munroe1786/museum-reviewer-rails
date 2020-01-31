class ReviewsController < ApplicationController
    before_action :set_review, only: [ :index, :show, :create, :edit, :update, :destroy]
    before_action :set_museum
    before_action :authorize_review, only: [:update, :destroy]

    def index
        if @museum
            @reviews = @museum.reviews
        else
            @reviews = Review.all
        end
    end

    def new
        if @museum
            @review = @museum.reviews.build
        else
            @review = Review.new
        end
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            flash[:success] = "Review successfully created"
            redirect_to museum_path(@review.museum)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @review
            @review.update(review_params)
            redirect_to museum_path(@review.museum_id)
            flash[:success] = "Review successfully updated"
        else
            render :edit
        end
    end

    def destroy
        @review.destroy
        redirect_to museum_path(@review.museum_id)
        flash[:success] = "Review successfully deleted"
    end

    private

    def set_review
        @review = Review.find_by_id(params[:id])
    end

    def set_museum
        @museum = Museum.find_by_id(params[:museum_id])
    end

    def review_params
        params.require(:review).permit(:museum_id, :date_visited, :content, :rating)
    end

    def authorize_review
        redirect_back unless @review.user == current_user
    end

end
