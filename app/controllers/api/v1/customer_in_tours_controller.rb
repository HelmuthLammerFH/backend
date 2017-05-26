class Api::V1::CustomerInToursController < Api::V1::BaseController
  before_action :set_customer_in_tour, only: [:show, :edit, :update, :destroy]

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

    respond_to do |format|
      if @customer_in_tour.save
        format.html { redirect_to @customer_in_tour, notice: 'Customer in tour was successfully created.' }
        format.json { render :show, status: :created, location: @customer_in_tour }
      else
        format.html { render :new }
        format.json { render json: @customer_in_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_in_tours/1
  # PATCH/PUT /customer_in_tours/1.json
  def update
    respond_to do |format|
      if @customer_in_tour.update(customer_in_tour_params)
        format.html { redirect_to @customer_in_tour, notice: 'Customer in tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_in_tour }
      else
        format.html { render :edit }
        format.json { render json: @customer_in_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_in_tours/1
  # DELETE /customer_in_tours/1.json
  def destroy
    @customer_in_tour.destroy
    respond_to do |format|
      format.html { redirect_to customer_in_tours_url, notice: 'Customer in tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_in_tour
      @customer_in_tour = CustomerInTour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_in_tour_params
      params.require(:customer_in_tour).permit(:joomlaID, :bookedDate, :participated, :starRating, :feedbackTourGuid, :createdFrom, :changedFrom, :syncedFrom, :deleteFlag)
    end
end
