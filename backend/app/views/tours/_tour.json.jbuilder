json.extract! tour, :id, :Bezeichnung, :MaxTeilnehmer, :Preis, :TourStartDatum, :TourEndeDatum, :EintragErstelltVon, :EintragGeaendertVon, :SyncedFrom, :created_at, :updated_at
json.url tour_url(tour, format: :json)
