class ReportController < ApplicationController
  def index
    @tours_startdate = params['start'] ? params['start'] : '2017-01-01'
    @tours_enddate = params['end'] ? params['end'] : '2017-12-31'

    @totalMoney = 0

    # tourguides
    @tourguides = Tourguide.all
    @tourscount = []
    @tourguides.each do |tg|
      @temp = Tour.where('Tourguide_id = ? AND startDate >= ? AND endDate <= ? ', tg.id, @tours_startdate, @tours_enddate).count
      @tourscount.push(@temp)
    end

    # tours
    @tours = Tour.where('startDate >= ? AND endDate <= ? ', @tours_startdate, @tours_enddate)
    @tourssum = []
    @toursstars = []
    @tourCustomerCount = []
    @tours.each do |to|
      @customers_in_tour = CustomerInTour.where('tour_id = ?', to.id).count
      @sum = @customers_in_tour * to.price.to_f
      @tourssum.push(@sum)

      @sumStarRating = CustomerInTour.group(:tour_id).where('tour_id = ?', to.id).sum(:starRating)

      # for calculation of average rating
      @customers_in_tour_with_rating_count = CustomerInTour.where('tour_id = ?', to.id).where.not(starRating: nil).count
      @averageRating = (@sumStarRating[to.id].to_f/@customers_in_tour_with_rating_count)

      if @averageRating.nan?
        @averageRating = 0.0
      end

      @toursstars.push(@averageRating)
      @tourCustomerCount.push(@customers_in_tour)

      @totalMoney = @totalMoney + @sum
    end
  end
end
