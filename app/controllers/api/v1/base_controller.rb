class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :destroy_session

  def destroy_session
    request.session_options[:skip] = true
  end

  def set_model(table, clientID, id)
    if clientID.to_s == '1'
      return table.where("joomlaID = #{ id }").first
    else
      return table.find(id)
    end
  end

  def guard_sync(model, clientID)
    if clientID == 2
      if model.syncedFrom == 1
        render json: {error: "you are not allowed to overwrite the web because the web is the ruler of the world"}, :status => :forbidden
      end
    end
  end
end
