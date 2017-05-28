class Api::V1::RessourceForToursController < Api::V1::BaseController
  before_action :set_model_local, only: [:edit, :update, :destroy, :show]
  before_action :guard_sync_local, only: [:edit, :update, :destroy]

  # GET /ressource_for_tours
  # GET /ressource_for_tours.json
  def index
    @ressource_for_tours = RessourceForTour.all
  end

  # GET /ressource_for_tours/1
  # GET /ressource_for_tours/1.json
  def show
  end

  # GET /ressource_for_tours/new
  def new
    @ressource_for_tour = RessourceForTour.new
  end

  # GET /ressource_for_tours/1/edit
  def edit
  end

  # POST /ressource_for_tours
  # POST /ressource_for_tours.json
  def create
    @ressource_for_tour = RessourceForTour.new(ressource_for_tour_params)
    @ressource_for_tour = set_sync_state(@ressource_for_tour)
    respond_to do |format|
      if @ressource_for_tour.save
        format.html { redirect_to @ressource_for_tour, notice: 'Ressource for tour was successfully created.' }
        format.json { render :show, status: :created, location: @ressource_for_tour }
      else
        format.html { render :new }
        format.json { render json: @ressource_for_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ressource_for_tours/1
  # PATCH/PUT /ressource_for_tours/1.json
  def update
    @ressource_for_tour = set_sync_state(@ressource_for_tour)
    respond_to do |format|
      if @ressource_for_tour.update(ressource_for_tour_params)
        format.html { redirect_to @ressource_for_tour, notice: 'Ressource for tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @ressource_for_tour }
      else
        format.html { render :edit }
        format.json { render json: @ressource_for_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ressource_for_tours/1
  # DELETE /ressource_for_tours/1.json
  def destroy
    @ressource_for_tour.destroy
    respond_to do |format|
      format.html { redirect_to ressource_for_tours_url, notice: 'Ressource for tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # checks for the app that requests and uses the correct id
    def set_model_local
      @ressource_for_tour = set_model(RessourceForTour)
    end

    # checks for the app that requests and uses the correct id
    def guard_sync_local
      guard_sync(@ressource_for_tour)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def ressource_for_tour_params
      params.require(:ressource_for_tour).permit(:createdFrom, :picture, :changedFrom, :RessourceTyp_id)
    end
end
