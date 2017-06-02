class Api::V1::CustomerInTourCustomController < Api::V1::BaseController
  before_action :set_model_local, only: [:update]
  before_action :guard_sync_local, only: [:update]

  def update
    if params['starRating'] != nil
      @customer_in_tour['starRating'] = params['starRating']
    elsif params['feedbackTourGuid'] != nil
      @customer_in_tour['feedbackTourGuid'] = params['feedbackTourGuid']
    elsif params['participated'] != nil
      @customer_in_tour['participated'] = params['participated']
    end
    @customer_in_tour = set_sync_state(@customer_in_tour)

    if @customer_in_tour.save
        render json: @customer_in_tour, :status => :ok
    else
       render json: @customer_in_tour.error, :status => :unprocessable_entity
    end
  end

  private
  # checks for the app that requests and uses the correct id
  def set_model_local
    if params['user_id'] != nil && params['tour_id'] != nil
      @customer_in_tour = CustomerInTour.where("customer_id = ? AND tour_id = ?", params[:user_id], params[:tour_id]).first
      if @customer_in_tour == nil
        render json: {error: "no record found with these parameters"}, :status => :not_found
      end
    else
      render json: {error: "user_id or/and tour_guid missing"}, :status => :forbidden
    end
  end

  def guard_sync_local
    guard_sync(@customer_in_tour)
  end
end
