class Api::V1::TourPositionsController < Api::V1::BaseController
  before_action :set_model, only: [:edit, :update, :destroy]
  before_action :set_model_show, only: [:show]
  before_action :check_synced_from, only: [:edit, :update, :destroy]

  # GET /tour_positions
  # GET /tour_positions.json
  def index
    @tour_positions = TourPosition.all
  end

  # GET /tour_positions/1
  # GET /tour_positions/1.json
  def show
  end

  # GET /tour_positions/new
  def new
    @tour_position = TourPosition.new
  end

  # GET /tour_positions/1/edit
  def edit
  end

  # POST /tour_positions
  # POST /tour_positions.json
  def create
    @tour_position = TourPosition.new(tour_position_params)

    respond_to do |format|
      if @tour_position.save
        format.html { redirect_to @tour_position, notice: 'Tour position was successfully created.' }
        format.json { render :show, status: :created, location: @tour_position }
      else
        format.html { render :new }
        format.json { render json: @tour_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tour_positions/1
  # PATCH/PUT /tour_positions/1.json
  def update
    respond_to do |format|
      if @tour_position.update(tour_position_params)
        format.html { redirect_to @tour_position, notice: 'Tour position was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour_position }
      else
        format.html { render :edit }
        format.json { render json: @tour_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_positions/1
  # DELETE /tour_positions/1.json
  def destroy
    @tour_position.destroy
    respond_to do |format|
      format.html { redirect_to tour_positions_url, notice: 'Tour position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # checks for the app that requests and uses the correct id
    def set_model
      @tour_position = set_variable(TourPosition, params[:syncedFrom], params[:id])
    end

    # checks for the app that requests and uses the correct id
    def set_model_show
      @tour_position = set_variable(TourPosition, params[:syncedFrom], params[:id])
    end

    # checks for the app that requests and uses the correct id
    def check_synced_from
      global_check_synced_from(@tour_position, tour_position_params['syncedFrom'])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_position_params
      params.require(:tour_position).permit(:joomlaID, :name, :position, :createdFrom, :changedFrom, :syncedFrom, :deleteFlag)
    end
end
