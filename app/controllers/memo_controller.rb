class MemoController < ApplicationController

  def index
    @movie = Movie.first
  end

end
