class Api::V1::ToursController < Api::V1::BaseController
  before_action :set_tour, only: [:edit, :update, :destroy]
  before_action :set_tour_show, only: [:show]
  before_action :check_synced_from, only: [:edit, :update, :destroy]

  # GET /tours
  # GET /tours.json
  def index
    @tours = Tour.all
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
  end

  # GET /tours/new
  def new
    @tour = Tour.new
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours
  # POST /tours.json
  def create
    @tour = Tour.new(tour_params)

    respond_to do |format|
      if @tour.save
        format.html {redirect_to @tour, notice: 'Tour was successfully created.'}
        format.json {render :show, status: :created, location: @tour}
      else
        format.html {render :new}
        format.json {render json: @tour.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html {redirect_to @tour, notice: 'Tour was successfully updated.'}

        format.json {render :show, status: :ok, location: @tour}
      else
        format.html {render :edit}
        format.json {render json: @tour.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html {redirect_to tours_url, notice: 'Tour was successfully destroyed.'}
      format.json {head :no_content}
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  # checks for the app that requests and uses the correct id
  def set_tour_show
    if params[:syncedFrom] == '1'
      @tour = Tour.where("joomlaID = #{ params[:id] }").first
    else
      @tour = Tour.find(params[:id])
    end

  end

  # checks for the app that requests and uses the correct id
  def set_tour

    if tour_params["syncedFrom"] == 1
      @tour = Tour.where("joomlaID = #{params[:id]}").first
    else
      @tour = Tour.find(params[:id])
    end

  end

  # checks if app with sycnedFrom==2 wants to change entry from web and is therefore not allowed
  def check_synced_from
    if tour_params["syncedFrom"] == 2
      if @tour.syncedFrom == 1
        render json: {error: "you are not allowed to overwrite the web because the web is the ruler of the world"}, :status => :forbidden
      end
    end

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tour_params
    params.require(:tour).permit(:joomlaID, :name, :maxAttendees, :price, :startDate, :endDate, :createdFrom, :changedFrom, :syncedFrom, :deleteFlag)
  end
end
