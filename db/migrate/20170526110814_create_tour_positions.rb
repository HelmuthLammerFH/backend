class CreateTourPositions < ActiveRecord::Migration[5.0]
  def change
    create_table :tour_positions do |t|
      t.integer :joomlaID
      t.string :name
      t.string :position
      t.string :createdFrom
      t.string :changedFrom
      t.integer :syncedFrom
      t.boolean :deleteFlag

      t.timestamps
    end
  end
end
