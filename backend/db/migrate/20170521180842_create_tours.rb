class CreateTours < ActiveRecord::Migration[5.0]
  def change
    create_table :tours do |t|
      t.string :Bezeichnung
      t.integer :MaxTeilnehmer
      t.float :Preis
      t.datetime :TourStartDatum
      t.datetime :TourEndeDatum
      t.string :EintragErstelltVon
      t.string :EintragGeaendertVon
      t.integer :SyncedFrom

      t.timestamps
    end
  end
end
