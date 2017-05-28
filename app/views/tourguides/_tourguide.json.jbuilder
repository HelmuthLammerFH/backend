json.extract! tourguide, :id, :tourGuideSince, :createdFrom, :changedFrom, :syncedFrom, :deleteFlag, :user_id, :agency_id, :created_at, :updated_at
json.url tourguide_url(tourguide, format: :json)
