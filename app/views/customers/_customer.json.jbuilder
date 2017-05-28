json.extract! customer, :id, :joomlaID, :note, :createdFrom, :changedFrom, :syncedFrom, :deleteFlag, :created_at, :updated_at
json.url customer_url(customer, format: :json)
