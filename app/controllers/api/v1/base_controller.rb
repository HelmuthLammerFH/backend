class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :destroy_session

  def destroy_session
    request.session_options[:skip] = true
  end

  def set_variable(table, decider, id)
    if decider == 1
      return table.where("joomlaID = #{ id }").first
    else
      return table.find(id)
    end
  end

  def global_check_synced_from(model, syncedFrom)
    if syncedFrom == 2
      if model.syncedFrom == 1
        render json: {error: "you are not allowed to overwrite the web because the web is the ruler of the world"}, :status => :forbidden
      end
    end
  end
end
