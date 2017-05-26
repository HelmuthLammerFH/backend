class Api::V1::StatusesController < Api::V1::BaseController
  before_action :set_model, only: [:edit, :update, :destroy]
  before_action :set_model_show, only: [:show]
  before_action :check_synced_from, only: [:edit, :update, :destroy]


  # GET /statuses
  # GET /statuses.json
  def index
    @statuses = Status.all
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
  end

  # GET /statuses/new
  def new
    @status = Status.new
  end

  # GET /statuses/1/edit
  def edit
  end

  # POST /statuses
  # POST /statuses.json
  def create
    @status = Status.new(status_params)

    respond_to do |format|
      if @status.save
        format.html { redirect_to @status, notice: 'Status was successfully created.' }
        format.json { render :show, status: :created, location: @status }
      else
        format.html { render :new }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statuses/1
  # PATCH/PUT /statuses/1.json
  def update
    respond_to do |format|
      if @status.update(status_params)
        format.html { redirect_to @status, notice: 'Status was successfully updated.' }
        format.json { render :show, status: :ok, location: @status }
      else
        format.html { render :edit }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @status.destroy
    respond_to do |format|
      format.html { redirect_to statuses_url, notice: 'Status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # checks for the app that requests and uses the correct id
    def set_model
      @status = set_variable(Status, params[:syncedFrom], params[:id])
    end

    # checks for the app that requests and uses the correct id
    def set_model_show
      @status = set_variable(Status, params[:syncedFrom], params[:id])
    end

    # checks for the app that requests and uses the correct id
    def check_synced_from
      global_check_synced_from(@status, status_params['syncedFrom'])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_params
      params.require(:status).permit(:joomlaID, :name, :createdFrom, :changedFrom, :syncedFrom, :deleteFlag)
    end
end
