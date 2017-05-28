class CreateAgencies < ActiveRecord::Migration[5.0]
  def change
    create_table :agencies do |t|
      t.integer :joomlaID
      t.string :name
      t.date :entranceDate
      t.boolean :deleteFlag

      t.timestamps
    end
  end
end
