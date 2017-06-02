class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :destroy_session
  before_action :guard_client_id


  def destroy_session
    request.session_options[:skip] = true
  end

  def set_model(table)
    return table.find(params[:id])
  end

  def guard_sync(model)
    if params[:clientID].to_s == '2'
      if model.syncedFrom.to_s == '1'
        render json: {error: "you are not allowed to overwrite the web because the web is the ruler of the world"}, :status => :forbidden
      end
    end
  end

  def set_sync_state(model)
    model.syncedFrom = params[:clientID]
    return model
  end

  def guard_client_id
    if params[:clientID] == nil
      render json: { error: "clientID is missing" }, :status => :forbidden
    end
  end

  def set_sync_state_on_object_after_read (model)
    if params[:clientID].to_s == '2' && model.syncedFrom == 1
      model.syncedFrom = 0
      model.save
    end
  end

  def set_sync_state_on_array_after_read (models)
    if params[:clientID].to_s == '2'
      models.each do |model|
        if model.syncedFrom == 1
          model.syncedFrom = 0
          model.save
        end
      end
    end
  end
end
