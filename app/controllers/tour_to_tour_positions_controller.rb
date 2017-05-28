class TourToTourPositionsController < ApplicationController
  before_action :set_tour_to_tour_position, only: [:show, :edit, :update, :destroy]

  # GET /tour_to_tour_positions
  # GET /tour_to_tour_positions.json
  def index
    @tour_to_tour_positions = TourToTourPosition.all
  end

  # GET /tour_to_tour_positions/1
  # GET /tour_to_tour_positions/1.json
  def show
  end

  # GET /tour_to_tour_positions/new
  def new
    @tour_to_tour_position = TourToTourPosition.new
  end

  # GET /tour_to_tour_positions/1/edit
  def edit
  end

  # POST /tour_to_tour_positions
  # POST /tour_to_tour_positions.json
  def create
    @tour_to_tour_position = TourToTourPosition.new(tour_to_tour_position_params)

    respond_to do |format|
      if @tour_to_tour_position.save
        format.html { redirect_to @tour_to_tour_position, notice: 'Tour to tour position was successfully created.' }
        format.json { render :show, status: :created, location: @tour_to_tour_position }
      else
        format.html { render :new }
        format.json { render json: @tour_to_tour_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tour_to_tour_positions/1
  # PATCH/PUT /tour_to_tour_positions/1.json
  def update
    respond_to do |format|
      if @tour_to_tour_position.update(tour_to_tour_position_params)
        format.html { redirect_to @tour_to_tour_position, notice: 'Tour to tour position was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour_to_tour_position }
      else
        format.html { render :edit }
        format.json { render json: @tour_to_tour_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_to_tour_positions/1
  # DELETE /tour_to_tour_positions/1.json
  def destroy
    @tour_to_tour_position.destroy
    respond_to do |format|
      format.html { redirect_to tour_to_tour_positions_url, notice: 'Tour to tour position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour_to_tour_position
      @tour_to_tour_position = TourToTourPosition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_to_tour_position_params
      params.require(:tour_to_tour_position).permit(:joomlaID, :tourPosition_id, :startDate, :endDate, :createdFrom, :changedFrom, :syncedFrom, :deleteFlag)
    end
end
