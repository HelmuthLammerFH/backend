class Api::V1::TourpositionsController < Api::V1::BaseController
  before_action :set_model_local, only: [:edit, :update, :destroy, :show]
  before_action :guard_sync_local, only: [:edit, :update, :destroy]
  after_action :set_sync_state_on_object_after_read_local, only: [:show]
  after_action :set_sync_state_on_array_after_read_local, only: [:index]

  # GET /tour_positions
  # GET /tour_positions.json
  def index
    @tourpositions = Tourposition.all
  end

  # GET /tour_positions/1
  # GET /tour_positions/1.json
  def show
  end

  # GET /tour_positions/new
  def new
    @tourposition = Tourposition.new
  end

  # GET /tour_positions/1/edit
  def edit
  end

  # POST /tour_positions
  # POST /tour_positions.json
  def create
    @tourposition = Tourposition.new(tour_position_params)
    @tourposition = set_sync_state(@tourposition)
    respond_to do |format|
      if @tourposition.save
        format.html { redirect_to @tourposition, notice: 'Tour position was successfully created.' }
        format.json { render :show, status: :created, location: @tourposition }
      else
        format.html { render :new }
        format.json { render json: @tourposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tour_positions/1
  # PATCH/PUT /tour_positions/1.json
  def update
    @tourposition = set_sync_state(@tourposition)
    respond_to do |format|
      if @tourposition.update(tour_position_params)
        format.html { redirect_to @tourposition, notice: 'Tour position was successfully updated.' }
        format.json { render :show, status: :ok, location: @tourposition }
      else
        format.html { render :edit }
        format.json { render json: @tourposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_positions/1
  # DELETE /tour_positions/1.json
  def destroy
    @tourposition.destroy
    respond_to do |format|
      format.html { redirect_to tour_positions_url, notice: 'Tour position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # checks for the app that requests and uses the correct id
    def set_model_local
      @tourposition = set_model(Tourposition)
    end

    # checks for the app that requests and uses the correct id
    def guard_sync_local
      guard_sync(@tourposition)
    end

  def set_sync_state_on_object_after_read_local
    set_sync_state_on_object_after_read(@tourposition)
  end

  def set_sync_state_on_array_after_read_local
    set_sync_state_on_array_after_read(@tourpositions)
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_position_params
      params.require(:tourposition).permit(:id, :name, :position, :description, :price, :createdFrom, :changedFrom)
    end
end
