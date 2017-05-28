class Api::V1::LoginController < Api::V1::BaseController
  def index
    @user = User.where("username = ? AND passwort = ?", params[:username], params[:password]).first

    if @user != nil
      render json: {status: "ok"}, :status => :accepted
    else
      render json: {error: "no access"}, :status => :forbidden
    end
  end
end
