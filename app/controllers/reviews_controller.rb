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
    # get form info and add to the model
    @review = Review.new(review_form_params)

    # return to home if form is saved, otherwise render the form page to show errors
    if @review.save
      redirect_to root_path
    else
      render "new"
    end
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
    if @review.update(review_form_params)
      redirect_to review_path(@review)
    else
      render "edit"
    end

  end

  def review_form_params
    params.require(:review).permit(:title, :restaurant, :cuisine, :body, :score)
  end

end
