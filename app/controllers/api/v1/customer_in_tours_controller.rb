class Api::V1::CustomerInToursController < Api::V1::BaseController
  before_action :set_model_local, only: [:edit, :update, :destroy, :show]
  before_action :guard_sync_local, only: [:edit, :update, :destroy]
  after_action :set_sync_state_on_object_after_read_local, only: [:show]
  after_action :set_sync_state_on_array_after_read_local, only: [:index]

  # GET /customer_in_tours
  # GET /customer_in_tours.json
  def index
    @customer_in_tours = CustomerInTour.all
  end

  # GET /customer_in_tours/1
  # GET /customer_in_tours/1.json
  def show
  end

  # GET /customer_in_tours/new
  def new
    @customer_in_tour = CustomerInTour.new
  end

  # GET /customer_in_tours/1/edit
  def edit
  end

  # POST /customer_in_tours
  # POST /customer_in_tours.json
  def create
    @customer_in_tour = CustomerInTour.new(customer_in_tour_params)
    @customer_in_tour = set_sync_state(@customer_in_tour)

    respond_to do |format|
      if @customer_in_tour.save
        format.html {redirect_to @customer_in_tour, notice: 'Customer in tour was successfully created.'}
        format.json {render :show, status: :created, location: @customer_in_tour}
      else
        format.html {render :new}
        format.json {render json: @customer_in_tour.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /customer_in_tours/1
  # PATCH/PUT /customer_in_tours/1.json
  def update
    @customer_in_tour = set_sync_state(@customer_in_tour)

    respond_to do |format|
      if @customer_in_tour.update(customer_in_tour_params)
        format.html {redirect_to @customer_in_tour, notice: 'Customer in tour was successfully updated.'}
        format.json {render :show, status: :ok, location: @customer_in_tour}
      else
        format.html {render :edit}
        format.json {render json: @customer_in_tour.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /customer_in_tours/1
  # DELETE /customer_in_tours/1.json
  def destroy
    @customer_in_tour.destroy
    respond_to do |format|
      format.html {redirect_to customer_in_tours_url, notice: 'Customer in tour was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # checks for the app that requests and uses the correct id
  def set_model_local
    @customer_in_tour = set_model(CustomerInTour)
  end

  # checks for the app that requests and uses the correct id
  def guard_sync_local
    guard_sync(@customer_in_tour)
  end

  def set_sync_state_on_object_after_read_local
    set_sync_state_on_object_after_read(@customer_in_tour)
  end

  def set_sync_state_on_array_after_read_local
    set_sync_state_on_array_after_read(@customer_in_tours)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_in_tour_params
    params.require(:customer_in_tour).permit(:bookedDate, :participated, :starRating, :feedbackTourGuid, :createdFrom, :changedFrom, :customer_id, :tour_id, :user_id)
  end
end
