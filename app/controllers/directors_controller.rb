class DirectorsController < ApplicationController

  def index
    @movies = scope
  end

  def actors
    @directors = []
  end

  private

  def scope
    Movie.page(params[:page]).per(100).order(:id)
  end

end
