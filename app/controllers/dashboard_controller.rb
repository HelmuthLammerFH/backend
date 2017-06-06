class DashboardController < ApplicationController
  def index
    @tourGuideData = [
        ['Hubert', 12],
        ['Franz', 22],
        ['Herbert', 1],
        ['Walter', 4],
        ['Thomas', 7]
    ]

    @linchartData = [
        ['12.12.2016', '133'],
        ['14.12.2016', '143'],
        ['16.12.2016', '323'],
        ['18.12.2016', '893']
    ]

    #@CustomersPerTour  = Tour.joins(:Tourguide)

    #@CustomersPerTour = Tour.joins(:CustomerInTour)


    # ======================
    #  Anzahl ned korrekt :((
    #   @CustomersPerTour = Tour.joins("INNER JOIN customer_in_tours as cit ON cit.tour_id = tours.id ").group(:id).select('count(tours.id) AS leit, tours.name')
    # ======================

    # CustomerInTour.group(:tour_id).count #works


    puts "asdksalladlkdadkjlkajdöldöjsajdsadjsakdjsadjdsajdjdalk"
    puts json: @CustomersPerTour
  end
end
