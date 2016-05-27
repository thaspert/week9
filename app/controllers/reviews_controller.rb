class ReviewsController < ApplicationController

  def create

    # Review.new(....)
    # Review.create(....)
    # review = Review.find_by(id: 5)
    # review.update(.....)

    review_params = params.require(:review).permit(:movie_id, :rating, :content)
    review = Review.new(review_params)
    review.user_id = session[:user_id]
    review.save

    redirect_to movie_url(params[:review][:movie_id])
  end


end
