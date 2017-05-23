json.extract! customer_in_tour, :id, :bookedDate, :participated, :starRating, :feedbackTourGuid, :createdFrom, :changedFrom, :syncedFrom, :created_at, :updated_at
json.url customer_in_tour_url(customer_in_tour, format: :json)
