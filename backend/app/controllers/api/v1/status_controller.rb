class Api::V1::StatusController < Api::V1::BaseController
  def index
    @status = Status.all;

    render :json => @status
  end

  def new
  end
end
