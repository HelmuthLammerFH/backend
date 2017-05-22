json.extract! customer, :id, :note, :createdFrom, :changedFrom, :syncedFrom, :created_at, :updated_at
json.url customer_url(customer, format: :json)
