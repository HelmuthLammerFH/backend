class RessourceTypsController < ApplicationController
  before_action :set_ressource_typ, only: [:show, :edit, :update, :destroy]

  # GET /ressource_typs
  # GET /ressource_typs.json
  def index
    @ressource_typs = RessourceTyp.all
  end

  # GET /ressource_typs/1
  # GET /ressource_typs/1.json
  def show
  end

  # GET /ressource_typs/new
  def new
    @ressource_typ = RessourceTyp.new
  end

  # GET /ressource_typs/1/edit
  def edit
  end

  # POST /ressource_typs
  # POST /ressource_typs.json
  def create
    @ressource_typ = RessourceTyp.new(ressource_typ_params)

    respond_to do |format|
      if @ressource_typ.save
        format.html { redirect_to @ressource_typ, notice: 'Ressource typ was successfully created.' }
        format.json { render :show, status: :created, location: @ressource_typ }
      else
        format.html { render :new }
        format.json { render json: @ressource_typ.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ressource_typs/1
  # PATCH/PUT /ressource_typs/1.json
  def update
    respond_to do |format|
      if @ressource_typ.update(ressource_typ_params)
        format.html { redirect_to @ressource_typ, notice: 'Ressource typ was successfully updated.' }
        format.json { render :show, status: :ok, location: @ressource_typ }
      else
        format.html { render :edit }
        format.json { render json: @ressource_typ.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ressource_typs/1
  # DELETE /ressource_typs/1.json
  def destroy
    @ressource_typ.destroy
    respond_to do |format|
      format.html { redirect_to ressource_typs_url, notice: 'Ressource typ was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ressource_typ
      @ressource_typ = RessourceTyp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ressource_typ_params
      params.require(:ressource_typ).permit(:name, :createdFrom, :changedFrom, :syncedFrom)
    end
end
