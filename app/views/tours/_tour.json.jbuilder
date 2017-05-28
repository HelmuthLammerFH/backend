json.extract! tour, :id, :joomlaID, :name, :maxAttendees, :price, :startDate, :endDate, :createdFrom, :changedFrom, :syncedFrom, :deleteFlag, :created_at, :updated_at
json.url tour_url(tour, format: :json)
