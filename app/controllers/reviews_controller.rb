class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]
    before_action :set_museum

    def index
        if @museum
            @reviews = @museum.reviews
        else
            @reviews = Review.all
        end
    end

    def show
    end

    def new
        @review = Review.new
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            flash[:success] = "Review successfully created"
            redirect_to museum_path(museum)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @review.update(review_params)
            flash[:success] = "Review successfully updated"
            redirect_to review_path(@review)
        else
            render :edit
        end
    end

    def destroy
        @review.destroy
        redirect_to reviews_path
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

end
