class DashboardController < ApplicationController

  def show
    @movie = Movie.first
  end

end
