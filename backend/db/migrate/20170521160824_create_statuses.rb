class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.integer :StatusID
      t.string :Bezeichnung
      t.timestamp :EintragErstelltAm
      t.string :EintragErstelltVon
      t.timestamp :EintragGeaendertAm
      t.string :EintragGeandertVon

      t.timestamps
    end
  end
end
