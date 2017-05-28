class Api::V1::TourGuideToAgentursController < Api::V1::BaseController
  before_action :set_model_local, only: [:edit, :update, :destroy, :show]
  before_action :guard_sync_local, only: [:edit, :update, :destroy]


  # GET /tour_guide_to_agenturs
  # GET /tour_guide_to_agenturs.json
  def index
    @tour_guide_to_agenturs = TourGuideToAgentur.all
  end

  # GET /tour_guide_to_agenturs/1
  # GET /tour_guide_to_agenturs/1.json
  def show
  end

  # GET /tour_guide_to_agenturs/new
  def new
    @tour_guide_to_agentur = TourGuideToAgentur.new
  end

  # GET /tour_guide_to_agenturs/1/edit
  def edit
  end

  # POST /tour_guide_to_agenturs
  # POST /tour_guide_to_agenturs.json
  def create
    @tour_guide_to_agentur = TourGuideToAgentur.new(tour_guide_to_agentur_params)
    @tour_guide_to_agentur = set_sync_state(@tour_guide_to_agentur)
    respond_to do |format|
      if @tour_guide_to_agentur.save
        format.html { redirect_to @tour_guide_to_agentur, notice: 'Tour guide to agentur was successfully created.' }
        format.json { render :show, status: :created, location: @tour_guide_to_agentur }
      else
        format.html { render :new }
        format.json { render json: @tour_guide_to_agentur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tour_guide_to_agenturs/1
  # PATCH/PUT /tour_guide_to_agenturs/1.json
  def update
    @tour_guide_to_agentur = set_sync_state(@tour_guide_to_agentur)
    respond_to do |format|
      if @tour_guide_to_agentur.update(tour_guide_to_agentur_params)
        format.html { redirect_to @tour_guide_to_agentur, notice: 'Tour guide to agentur was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour_guide_to_agentur }
      else
        format.html { render :edit }
        format.json { render json: @tour_guide_to_agentur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_guide_to_agenturs/1
  # DELETE /tour_guide_to_agenturs/1.json
  def destroy
    @tour_guide_to_agentur.destroy
    respond_to do |format|
      format.html { redirect_to tour_guide_to_agenturs_url, notice: 'Tour guide to agentur was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # checks for the app that requests and uses the correct id
    def set_model_local
      @tour_guide_to_agentur = set_model(TourGuideToAgentur)
    end

    # checks for the app that requests and uses the correct id
    def guard_sync_local
      guard_sync(@tour_guide_to_agentur)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_guide_to_agentur_params
      params.require(:tour_guide_to_agentur).permit(:agency_id, :tourGuide_id, :createdFrom, :changedFrom, :syncedFrom)
    end
end
