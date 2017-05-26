class Api::V1::CustomersController < Api::V1::BaseController
  before_action :set_model, only: [:edit, :update, :destroy]
  before_action :set_model_show, only: [:show]
  before_action :check_synced_from, only: [:edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # checks for the app that requests and uses the correct id
    def set_model
      @customer = set_variable(Customer, params[:syncedFrom], params[:id])
    end

    # checks for the app that requests and uses the correct id
    def set_model_show
      @customer = set_variable(Customer, params[:syncedFrom], params[:id])
    end

    # checks for the app that requests and uses the correct id
    def check_synced_from
      global_check_synced_from(@customer, customer_params['syncedFrom'])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:joomlaID, :note, :createdFrom, :changedFrom, :syncedFrom, :deleteFlag)
    end
end
