class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]

    def index
        @reviews = Review.all 
    end

    def show
    end

    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        if @review.save
            flash[:success] = "Review successfully created"
            redirect_to reviews_path
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


end
