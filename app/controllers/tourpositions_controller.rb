class TourpositionsController < ApplicationController
  before_action :set_tourposition, only: [:show, :edit, :update, :destroy]

  # GET /tourpositions
  # GET /tourpositions.json
  def index
    @tourpositions = Tourposition.all
  end

  # GET /tourpositions/1
  # GET /tourpositions/1.json
  def show
  end

  # GET /tourpositions/new
  def new
    @tourposition = Tourposition.new
  end

  # GET /tourpositions/1/edit
  def edit
  end

  # POST /tourpositions
  # POST /tourpositions.json
  def create
    @tourposition = Tourposition.new(tourposition_params)

    respond_to do |format|
      if @tourposition.save
        format.html { redirect_to @tourposition, notice: 'Tourposition was successfully created.' }
        format.json { render :show, status: :created, location: @tourposition }
      else
        format.html { render :new }
        format.json { render json: @tourposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tourpositions/1
  # PATCH/PUT /tourpositions/1.json
  def update
    respond_to do |format|
      if @tourposition.update(tourposition_params)
        format.html { redirect_to @tourposition, notice: 'Tourposition was successfully updated.' }
        format.json { render :show, status: :ok, location: @tourposition }
      else
        format.html { render :edit }
        format.json { render json: @tourposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tourpositions/1
  # DELETE /tourpositions/1.json
  def destroy
    @tourposition.destroy
    respond_to do |format|
      format.html { redirect_to tourpositions_url, notice: 'Tourposition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tourposition
      @tourposition = Tourposition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tourposition_params
      params.require(:tourposition).permit(:name, :position, :description, :price, :createdFrom, :changedFrom, :syncedFrom, :deleteFlag)
    end
end
