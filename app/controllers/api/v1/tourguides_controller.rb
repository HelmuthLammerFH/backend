class Api::V1::TourguidesController < Api::V1::BaseController
  before_action :set_model_local, only: [:edit, :update, :destroy, :show]
  before_action :guard_sync_local, only: [:edit, :update, :destroy]

  # GET /tour_guides
  # GET /tour_guides.json
  def index
    @tourguides = Tourguide.all
  end

  # GET /tour_guides/1
  # GET /tour_guides/1.json
  def show
  end

  # GET /tour_guides/new
  def new
    @tourguide = Tourguide.new
  end

  # GET /tour_guides/1/edit
  def edit
  end

  # POST /tour_guides
  # POST /tour_guides.json
  def create
    @tourguide = Tourguide.new(tour_guide_params)
    @tourguide = set_sync_state(@tourguide)
    respond_to do |format|
      if @tourguide.save
        format.html { redirect_to @tourguide, notice: 'Tour guide was successfully created.' }
        format.json { render :show, status: :created, location: @tourguide }
      else
        format.html { render :new }
        format.json { render json: @tourguide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tour_guides/1
  # PATCH/PUT /tour_guides/1.json
  def update
    @tourguide = set_sync_state(@tourguide)
    respond_to do |format|
      if @tourguide.update(tour_guide_params)
        format.html { redirect_to @tourguide, notice: 'Tour guide was successfully updated.' }
        format.json { render :show, status: :ok, location: @tourguide }
      else
        format.html { render :edit }
        format.json { render json: @tourguide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_guides/1
  # DELETE /tour_guides/1.json
  def destroy
    @tourguide.destroy
    respond_to do |format|
      format.html { redirect_to tour_guides_url, notice: 'Tour guide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # checks for the app that requests and uses the correct id
    def set_model_local
      @tourguide = set_model(Tourguide)
    end

    # checks for the app that requests and uses the correct id
    def guard_sync_local
      guard_sync(@tourguide)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_guide_params
      params.require(:tourguide).permit(:tourGuideSince, :createdFrom, :changedFrom, :user_id, :agency_id)
    end
end
