class Api::V1::TourToPositionsController < Api::V1::BaseController
  before_action :set_model_local, only: [:edit, :update, :destroy, :show]
  before_action :guard_sync_local, only: [:edit, :update, :destroy]
  after_action :set_sync_state_on_object_after_read_local, only: [:show]
  after_action :set_sync_state_on_array_after_read_local, only: [:index]

  # GET /tour_to_positions
  # GET /tour_to_positions.json
  def index
    @tour_to_positions = TourToPosition.all
  end

  # GET /tour_to_positions/1
  # GET /tour_to_positions/1.json
  def show
  end

  # GET /tour_to_positions/new
  def new
    @tour_to_position = TourToPosition.new
  end

  # GET /tour_to_positions/1/edit
  def edit
  end

  # POST /tour_to_positions
  # POST /tour_to_positions.json
  def create
    @tour_to_position = TourToPosition.new(tour_to_position_params)
    @tour_to_position = set_sync_state(@tour_to_position)
    respond_to do |format|
      if @tour_to_position.save
        format.html { redirect_to @tour_to_position, notice: 'Tour to position was successfully created.' }
        format.json { render :show, status: :created, location: @tour_to_position }
      else
        format.html { render :new }
        format.json { render json: @tour_to_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tour_to_positions/1
  # PATCH/PUT /tour_to_positions/1.json
  def update
    @tour_to_position = set_sync_state(@tour_to_position)
    respond_to do |format|
      if @tour_to_position.update(tour_to_position_params)
        format.html { redirect_to @tour_to_position, notice: 'Tour to position was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour_to_position }
      else
        format.html { render :edit }
        format.json { render json: @tour_to_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_to_positions/1
  # DELETE /tour_to_positions/1.json
  def destroy
    @tour_to_position.destroy
    respond_to do |format|
      format.html { redirect_to tour_to_positions_url, notice: 'Tour to position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # checks for the app that requests and uses the correct id
  def set_model_local
    @tour_to_position = set_model(TourToPosition)
  end

  # checks for the app that requests and uses the correct id
  def guard_sync_local
    guard_sync(@tour_to_position)
  end

  def set_sync_state_on_object_after_read_local
    set_sync_state_on_object_after_read(@tour_to_positions)
  end

  def set_sync_state_on_array_after_read_local
    set_sync_state_on_array_after_read(@tour_to_positions)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tour_to_position_params
    params.require(:tour_to_position).permit(:startDate, :endDate, :createdFrom, :changedFrom, :tour_id, :Tourposition_id)
  end
end
