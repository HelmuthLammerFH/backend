json.extract! customer_in_tour, :id, :joomlaID, :bookedDate, :participated, :starRating, :feedbackTourGuid, :createdFrom, :changedFrom, :syncedFrom, :deleteFlag, :customer_id, :tour_id, :created_at, :updated_at
json.url customer_in_tour_url(customer_in_tour, format: :json)
