class ReviewsController < ApplicationController
  def index
      # list page for reviews
      @reviews = Review.all
  end

  def new
    # form for a new review
    @review = Review.new
  end

  def create
    # get form info and add to the database
    @review = Review.new(params.require(:review).permit(:title, :body, :score))

    # save to the database
    @review.save

    # redirect

    redirect_to root_path
  end

  def show
    # individual review page
    @review = Review.find(params[:id])
  end

end
