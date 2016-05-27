class ReviewsController < ApplicationController

  def create
    # TODO: create review here

    redirect_to movie_url(params[:movie_id])
  end


end
