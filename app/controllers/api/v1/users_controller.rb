class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_model, only: [:edit, :update, :destroy]
  before_action :set_model_show, only: [:show]
  before_action :check_synced_from, only: [:edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @user = set_variable(User, params[:syncedFrom], params[:id])
    end

    # checks for the app that requests and uses the correct id
    def set_model_show
      @user = set_variable(User, params[:syncedFrom], params[:id])
    end

    # checks for the app that requests and uses the correct id
    def check_synced_from
      global_check_synced_from(User, user_params['syncedFrom'])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:joomlaID, :firstname, :lastname, :birthdate, :address, :city, :email, :username, :passwort, :createdFrom, :changedFrom, :syncedFrom, :deleteFlag)
    end
end
