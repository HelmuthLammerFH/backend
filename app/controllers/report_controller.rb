class ReportController < ApplicationController
  def index
    @data = [
        ["Washington", "1789-04-29", "1797-03-03"],
        ["Adams", "1797-03-03", "1801-03-03"],
        ["Jefferson", "1801-03-03", "1809-03-03"]
    ]

    
  end

end
