class DashboardController < ApplicationController
  def index
    @tourGuideData = [
        ['Hubert', 12],
        ['Franz', 22],
        ['Herbert', 1],
        ['Walter', 4],
        ['Thomas', 7]
    ]


    #Sales Chart
    @sales_chart = []
    @totalMoney = 0
    @tours = Tour.order(:endDate)

    @tourssum = []
    @tours.each do |to|
      @customers_in_tour = CustomerInTour.where('tour_id = ?', to.id).count
      @sum = @customers_in_tour * to.price.to_f
      @tourssum.push(@sum)
      @totalMoney = @totalMoney + @sum
      @temp = [to.startDate, @totalMoney]
      @sales_chart.push(@temp)
    end
    #Sales Chart end


    #most booked tours
    @mostBookedTours = []
    @mostTours = CustomerInTour.group(:tour_id).order('count_id desc').count('id')
    @i = 0
    @mostTours.each do |key, value|
      @tour1 = Tour.find(key)
      # puts json: @tour1
      @tempItem = []
      @tempItem = [@tour1, value]
      if @i < 3
        @mostBookedTours.push(@tempItem)
      end
      @i+1
      # puts key
      #   puts value
    end


    #most booked tours end

  end
end
