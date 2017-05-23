class CreateRessourceForTours < ActiveRecord::Migration[5.0]
  def change
    create_table :ressource_for_tours do |t|
      t.string :createdFrom
      t.string :changedFrom
      t.integer :syncedFrom

      t.timestamps
    end
  end
end
