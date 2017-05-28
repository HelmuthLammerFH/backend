class Api::V1::TourGuidesController < Api::V1::BaseController
  before_action :set_model_local, only: [:edit, :update, :destroy, :show]
  before_action :guard_sync_local, only: [:edit, :update, :destroy]

  # GET /tour_guides
  # GET /tour_guides.json
  def index
    @tour_guides = TourGuide.all
  end

  # GET /tour_guides/1
  # GET /tour_guides/1.json
  def show
  end

  # GET /tour_guides/new
  def new
    @tour_guide = TourGuide.new
  end

  # GET /tour_guides/1/edit
  def edit
  end

  # POST /tour_guides
  # POST /tour_guides.json
  def create
    @tour_guide = TourGuide.new(tour_guide_params)

    respond_to do |format|
      if @tour_guide.save
        format.html { redirect_to @tour_guide, notice: 'Tour guide was successfully created.' }
        format.json { render :show, status: :created, location: @tour_guide }
      else
        format.html { render :new }
        format.json { render json: @tour_guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tour_guides/1
  # PATCH/PUT /tour_guides/1.json
  def update
    respond_to do |format|
      if @tour_guide.update(tour_guide_params)
        format.html { redirect_to @tour_guide, notice: 'Tour guide was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour_guide }
      else
        format.html { render :edit }
        format.json { render json: @tour_guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_guides/1
  # DELETE /tour_guides/1.json
  def destroy
    @tour_guide.destroy
    respond_to do |format|
      format.html { redirect_to tour_guides_url, notice: 'Tour guide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # checks for the app that requests and uses the correct id
    def set_model_local
      @tour_guide = set_model(TourGuide, params[:clientID], params[:id])
    end

    # checks for the app that requests and uses the correct id
    def guard_sync_local
      guard_sync(@tour_guide, params[:clientID])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_guide_params
      params.require(:tour_guide).permit(:joomlaID, :tourGuideSince, :createdFrom, :changedFrom, :syncedFrom, :deleteFlag)
    end
end
