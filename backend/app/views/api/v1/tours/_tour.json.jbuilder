json.extract! tour, :id, :name, :maxAttendees, :price, :startDate, :endDate, :createdFrom, :changedFrom, :syncedFrom, :created_at, :updated_at
json.url tour_url(tour, format: :json)
