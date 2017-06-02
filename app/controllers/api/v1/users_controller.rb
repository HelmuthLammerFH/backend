class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_model_local, only: [:edit, :update, :destroy, :show]
  before_action :guard_sync_local, only: [:edit, :update, :destroy]
  before_action :guard_user_type, only: [:create]
  after_action :add_customer_or_tourguide, only: [:create]

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
    @user = set_sync_state(@user)
    respond_to do |format|
      if @user.save
        format.html {redirect_to @user, notice: 'User was successfully created.'}
        format.json {render :show, status: :created, location: @user}
      else
        format.html {render :new}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = set_sync_state(@user)
    respond_to do |format|
      if @user.update(user_params)
        format.html {redirect_to @user, notice: 'User was successfully updated.'}
        format.json {render :show, status: :ok, location: @user}
      else
        format.html {render :edit}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html {redirect_to users_url, notice: 'User was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_model_local
    @user = set_model(User)
  end

  # checks for the app that requests and uses the correct id
  def guard_sync_local
    guard_sync(@user)
  end

  def add_customer_or_tourguide
    if params['userType'].to_s == '1'
      @newcustomer = Customer.new()
      @newcustomer['id'] = @user['id']
      @newcustomer['user_id'] = @user['id']
      @newcustomer['createdFrom'] = @user['createdFrom']
      @newcustomer['changedFrom'] = @user['changedFrom']
      @newcustomer = set_sync_state(@newcustomer)
      @newcustomer.save
    elsif params['userType'].to_s == '2'
      @newtourguide = Tourguide.new()
      @newtourguide['id'] = @user['id']
      @newtourguide['user_id'] = @user['id']
      @newtourguide['createdFrom'] = @user['createdFrom']
      @newtourguide['changedFrom'] = @user['changedFrom']
      @newtourguide['tourGuideSince'] = DateTime.now.strftime("%Y-%m-%d")
      @newtourguide = set_sync_state(@newtourguide)
      @newtourguide.save
    end
  end

  def guard_user_type
    if params['userType'] == nil
      render json: {error: "user type is missing"}, :status => :forbidden
      return
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:id, :firstname, :lastname, :birthdate, :address, :city, :email, :username, :passwort, :createdFrom, :changedFrom, :userType)
  end
end
