class MoviesController < ApplicationController

  def index
    @movies = scope
  end

  def show
    @movie  = Movie.find(params[:id])
    @actors = @movie.actors
    @votes  = @movie.votes
  end

  def high_rated
    @movies = scope

    #TODO: get high rated movies
    # High rated movie = any movie with the score higher than or equal to 6.
  end

  def letters
    @letters = []

    #TODO: get movies count per starting letter
  end

  def popular
    @movies = []

    #TODO: get popular movies
    # Top movie     = movie with the highest votes count
    # Popular movie = its votes count is the same or smaller by maxium of 10 votes compared to the top movie
  end

  private

  def scope
    Movie.page(params[:page]).per(100).order(:id)
  end

end
