json.extract! customer, :id, :joomlaID, :note, :createdFrom, :changedFrom, :syncedFrom, :deleteFlag, :user_id, :created_at, :updated_at
json.url customer_url(customer, format: :json)
