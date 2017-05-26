class Api::V1::AgenciesController < Api::V1::BaseController
  before_action :set_model, only: [:edit, :update, :destroy]
  before_action :set_model_show, only: [:show]
  before_action :check_synced_from, only: [:edit, :update, :destroy]

  # GET /agencies
  # GET /agencies.json
  def index
    @agencies = Agency.all
  end

  # GET /agencies/1
  # GET /agencies/1.json
  def show
  end

  # GET /agencies/new
  def new
    @agency = Agency.new
  end

  # GET /agencies/1/edit
  def edit
  end

  # POST /agencies
  # POST /agencies.json
  def create
    @agency = Agency.new(agency_params)

    respond_to do |format|
      if @agency.save
        format.html { redirect_to @agency, notice: 'Agency was successfully created.' }
        format.json { render :show, status: :created, location: @agency }
      else
        format.html { render :new }
        format.json { render json: @agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agencies/1
  # PATCH/PUT /agencies/1.json
  def update
    respond_to do |format|
      if @agency.update(agency_params)
        format.html { redirect_to @agency, notice: 'Agency was successfully updated.' }
        format.json { render :show, status: :ok, location: @agency }
      else
        format.html { render :edit }
        format.json { render json: @agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agencies/1
  # DELETE /agencies/1.json
  def destroy
    @agency.destroy
    respond_to do |format|
      format.html { redirect_to agencies_url, notice: 'Agency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_model
      @agency = set_variable(Agency, params[:syncedFrom], params[:id])
    end

    # checks for the app that requests and uses the correct id
    def set_model_show
      @agency = set_variable(Agency, params[:syncedFrom], params[:id])
    end

    # checks for the app that requests and uses the correct id
    def check_synced_from
      global_check_synced_from(Agency, agency_params['syncedFrom'])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agency_params
      params.require(:agency).permit(:joomlaID, :name, :entranceDate, :deleteFlag)
    end
end
