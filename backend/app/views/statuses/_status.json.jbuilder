json.extract! status, :id, :name, :createdFrom, :changedFrom, :syncedFrom, :created_at, :updated_at
json.url status_url(status, format: :json)
