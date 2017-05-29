class CreateTourpositions < ActiveRecord::Migration[5.0]
  def change
    create_table :tourpositions do |t|
      t.string :name
      t.string :position
      t.string :description
      t.float :price
      t.string :createdFrom
      t.string :changedFrom
      t.integer :syncedFrom
      t.boolean :deleteFlag, :default=>false

      t.timestamps
    end
  end
end
