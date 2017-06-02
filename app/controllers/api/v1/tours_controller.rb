class Api::V1::ToursController < Api::V1::BaseController
  before_action :set_model_local, only: [:edit, :update, :destroy, :show]
  before_action :guard_sync_local, only: [:edit, :update, :destroy]
  after_action :set_sync_state_on_object_after_read_local, only: [:show]
  after_action :set_sync_state_on_array_after_read_local, only: [:index]

  # GET /tours
  # GET /tours.json
  def index
    @tours = Tour.all
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
  end

  # GET /tours/new
  def new
    @tour = Tour.new
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours
  # POST /tours.json
  def create
    @tour = Tour.new(tour_params)
    @tour = set_sync_state(@tour)

    respond_to do |format|
      if @tour.save
        format.html {redirect_to @tour, notice: 'Tour was successfully created.'}
        format.json {render :show, status: :created, location: @tour}
      else
        format.html {render :new}
        format.json {render json: @tour.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    @tour = set_sync_state(@tour)

    respond_to do |format|
      if @tour.update(tour_params)
        format.html {redirect_to @tour, notice: 'Tour was successfully updated.'}

        format.json {render :show, status: :ok, location: @tour}
      else
        format.html {render :edit}
        format.json {render json: @tour.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html {redirect_to tours_url, notice: 'Tour was successfully destroyed.'}
      format.json {head :no_content}
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  # checks for the app that requests and uses the correct id
  def set_model_local
    @tour = set_model(Tour)
  end


  # checks for the app that requests and uses the correct id
  def guard_sync_local
    guard_sync(@tour)
  end

  def set_sync_state_on_object_after_read_local
    set_sync_state_on_object_after_read(@tour)
  end

  def set_sync_state_on_array_after_read_local
    set_sync_state_on_array_after_read(@tours)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tour_params
    params.require(:tour).permit(:id, :name, :maxAttendees, :price, :startDate, :endDate, :createdFrom, :changedFrom, :syncedFrom, :deleteFlag, :status_id, :Tourguide_id)
  end
end
