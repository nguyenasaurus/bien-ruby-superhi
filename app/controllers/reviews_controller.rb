class ReviewsController < ApplicationController
  def index
      # list page for reviews
      @reviews = ["Kodiak", "Bonobo", "O'Brien's"]
  end

  def new
    
  end

end
