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
    @review = Review.new(review_form_params)

    # save to the database
    @review.save

    # redirect
    redirect_to root_path
  end

  def show
    # find individual review 
    @review = Review.find(params[:id])
  end

  def destroy
    # find indivual review
    @review = Review.find(params[:id])

    # destroy
    @review.destroy

    # redirect to home page
    redirect_to root_path
  end

  def edit
    # find individual review (to edit)
    @review = Review.find(params[:id])
  end

  def update
    # find individual review (to update)
    @review = Review.find(params[:id])

    # update new info from form
    @review.update(review_form_params)

    redirect_to review_path(@review)
  end

  def review_form_params
    params.require(:review).permit(:title, :body, :score)
  end

end
