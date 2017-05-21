class StatusController < ApplicationController
  def index
    @status = Status.all;
  end

  def new
  end
end
