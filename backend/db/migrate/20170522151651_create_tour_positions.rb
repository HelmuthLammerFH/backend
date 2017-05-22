class CreateTourPositions < ActiveRecord::Migration[5.0]
  def change
    create_table :tour_positions do |t|
      t.string :name
      t.string :position
      t.string :createdFrom
      t.string :changedFrom
      t.integer :syncedFrom

      t.timestamps
    end
  end
end
