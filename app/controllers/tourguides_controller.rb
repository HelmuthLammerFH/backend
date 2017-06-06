class TourguidesController < ApplicationController
  before_action :set_tourguide, only: [:show, :edit, :update, :destroy]

  # GET /tourguides
  # GET /tourguides.json
  def index
    @tourguides = Tourguide.all
  end

  # GET /tourguides/1
  # GET /tourguides/1.json
  def show
    @tours = Tour.where('Tourguide_id = ?', @tourguide.id)
  end

  # GET /tourguides/new
  def new
    @tourguide = Tourguide.new
  end

  # GET /tourguides/1/edit
  def edit
  end

  # POST /tourguides
  # POST /tourguides.json
  def create
    @tourguide = Tourguide.new(tourguide_params)

    respond_to do |format|
      if @tourguide.save
        format.html { redirect_to @tourguide, notice: 'Tourguide was successfully created.' }
        format.json { render :show, status: :created, location: @tourguide }
      else
        format.html { render :new }
        format.json { render json: @tourguide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tourguides/1
  # PATCH/PUT /tourguides/1.json
  def update
    respond_to do |format|
      if @tourguide.update(tourguide_params)
        format.html { redirect_to @tourguide, notice: 'Tourguide was successfully updated.' }
        format.json { render :show, status: :ok, location: @tourguide }
      else
        format.html { render :edit }
        format.json { render json: @tourguide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tourguides/1
  # DELETE /tourguides/1.json
  def destroy
    @tourguide.destroy
    respond_to do |format|
      format.html { redirect_to tourguides_url, notice: 'Tourguide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tourguide
      @tourguide = Tourguide.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tourguide_params
      params.require(:tourguide).permit(:tourGuideSince, :createdFrom, :changedFrom, :syncedFrom, :deleteFlag, :user_id, :agency_id)
    end
end
