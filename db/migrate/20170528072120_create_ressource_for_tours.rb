class CreateRessourceForTours < ActiveRecord::Migration[5.0]
  def change
    create_table :ressource_for_tours do |t|
      t.integer :joomlaID
      t.string :createdFrom
      t.binary :picture
      t.string :changedFrom
      t.integer :syncedFrom
      t.boolean :deleteFlag

      t.timestamps
    end
  end
end
