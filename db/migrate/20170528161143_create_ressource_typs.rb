class CreateRessourceTyps < ActiveRecord::Migration[5.0]
  def change
    create_table :ressource_typs do |t|
      t.string :name
      t.string :createdFrom
      t.string :changedFrom
      t.integer :syncedFrom
      t.boolean :deleteFlag

      t.timestamps
    end
  end
end
