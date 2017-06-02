class Api::V1::GetAllNewEntriesController <  Api::V1::BaseController
  def get
    @tours = Tour.where("syncedFrom = ? ", params[:syncState])
    @tourposition = Tourposition.where("syncedFrom = ? ", params[:syncState])
    @customerintour = CustomerInTour.where("syncedFrom = ? ", params[:syncState])
    @ressourcefortour = RessourceForTour.where("syncedFrom = ? ", params[:syncState])
    @tourtoposition = TourToPosition.where("syncedFrom = ? ", params[:syncState])

    @tours.each do |tour|
      tour['syncedFrom'] = 0
      tour.save
    end

    @tourposition.each do |tourposition|
      tourposition['syncedFrom'] = 0
      tourposition.save
    end

    @customerintour.each do |customerintour|
      customerintour['syncedFrom'] = 0
      customerintour.save
    end

    @ressourcefortour.each do |ressourcefortour|
      ressourcefortour['syncedFrom'] = 0
      ressourcefortour.save
    end

    @tourtoposition.each do |tourtoposition|
      tourtoposition['syncedFrom'] = 0
      tourtoposition.save
    end

    render json: {
        "tours": @tours,
        "tourposition": @tourposition,
        "customerintour": @customerintour,
        "ressourcefortour": @ressourcefortour,
        "tourtoposition": @tourtoposition,
    }
  end
end
