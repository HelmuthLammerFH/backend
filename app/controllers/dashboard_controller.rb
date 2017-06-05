class DashboardController < ApplicationController
  def index

    @tours = Tour.includes(Tourguide: [ :user]).all
    #@tours = Tour.all
    @tourguides = @tours
    puts json: @tours
    puts json: @tourguides
  end
end
