class MoviesController < ApplicationController

  before_action :find_movie, :except => [:index, :create]

  def find_movie
    @movie = Movie.find_by(id: params[:id])
  end

  def index
    @movies = Movie.all
    if params[:keyword].present?
      @movies = @movies.joins(:actors).where("title LIKE ? OR year = ? OR actors.name LIKE ?",
                                             "%#{params[:keyword]}%", params[:keyword],
                                             "%#{params[:keyword]}%")
    end
    @movies = @movies.limit(100)

    respond_to do |format|
      format.html do
        render 'index'
      end
      format.json do
        render json: @movies
      end
      format.xml do
        render xml: @movies
      end
    end

  end

  def create
    @movie = Movie.new
    @movie.title = params[:movie][:title]
    @movie.plot = params[:movie][:plot]
    @movie.image_url = params[:movie][:image_url]
    @movie.director_id = params[:movie][:director_id]
    @movie.year = params[:movie][:year]
    if @movie.save
      redirect_to movies_url, notice: "Movie added! Thanks!"
    else
      # redirect_to new_movie_url, notice: "Something went wrong!"
      render 'new'
    end
  end

  def show
    if @movie == nil
      redirect_to movies_url
    end
    respond_to do |format|
      format.html do
        session[:movie_id] = @movie.id
      end
      format.json do
        render json: @movie
      end
    end
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def update
    @movie.title = params[:title]
    @movie.plot = params[:plot]
    @movie.image_url = params[:image_url]
    @movie.year = params[:year]
    @movie.save
    redirect_to movies_url(@movie)
  end

  def destroy
    if @movie
      @movie.delete
    end
    redirect_to movies_url
  end

end
