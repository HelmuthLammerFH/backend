json.extract! user, :id, :joomlaID, :firstname, :lastname, :birthdate, :address, :city, :email, :username, :passwort, :createdFrom, :changedFrom, :syncedFrom, :deleteFlag, :created_at, :updated_at
json.url user_url(user, format: :json)
