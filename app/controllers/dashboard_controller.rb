class DashboardController < ApplicationController
  def index
    #@tourGuideData = [
    #    ['Hubert', 12],
    #    ['Franz', 22],
    #    ['Herbert', 1],
    #    ['Walter', 4],
    #   ['Thomas', 7]
    #]


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
      if to.startDate != nil
        @startDate = to.startDate.strftime("%d/%m/%Y")
      end
      @temp = [@startDate, @totalMoney]
      @sales_chart.push(@temp)
    end
    # Sales Chart end


    #most booked tours
    @mostBookedTours = []
    @mostTours = CustomerInTour.group(:tour_id).order('count_id desc').count('id').take(3)

    @mostTours.each do |key, value|
      @tour1 = Tour.find(key)

      @sumStarRating = CustomerInTour.group(:tour_id).where('tour_id = ?', @tour1.id).sum(:starRating)

      @customers_in_tour_with_rating_count = CustomerInTour.where('tour_id = ?', @tour1.id).where.not(starRating: nil).where.not(starRating: 0).count

      @averageRating = ActionController::Base.helpers.number_with_precision((@sumStarRating[@tour1.id].to_f/@customers_in_tour_with_rating_count), precision: 2)
      #@rounded = ActionController::Base.helpers.number_with_precision((@sumStarRating[@tour1.id].to_f/@customers_in_tour_with_rating_count), precision: 0).to_i
      
      @tempItem = []
      @tempItem = [@tour1, value, @averageRating, @rounded]

      @mostBookedTours.push(@tempItem)
    end
    #most booked tours end

    # tourguides
    @tourguides = Tourguide.all
    @tourguidesChartData = []
    @tourguides.each do |tg|
      @temp = Tour.where('Tourguide_id = ?', tg.id).count
      @tempArray = []
      @tempArray.push(tg.user.lastname)
      @tempArray.push(@temp)
      @tourguidesChartData.push(@tempArray)
    end
    # tourguide end


    # tours
    @tours = Tour.all
    @tourssum = []
    @tours.each do |to|
      @customers_in_tour = CustomerInTour.where('tour_id = ?', to.id).count
      @sum = @customers_in_tour * to.price.to_f
      @tempArray = []
      @tempArray.push(to.name)
      @tempArray.push(@sum)
      @tourssum.push(@tempArray)
    end
    # tours end


  end
end
