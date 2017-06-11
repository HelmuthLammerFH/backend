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
    @tours.each do |to|
      @customers_in_tour = CustomerInTour.where('tour_id = ?', to.id).count
      @sum = @customers_in_tour * to.price.to_f
      @tourssum.push(@sum)
      @totalMoney = @totalMoney + @sum
    end
  end
end
