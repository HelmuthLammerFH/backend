class CreateTourToTourPositions < ActiveRecord::Migration[5.0]
  def change
    create_table :tour_to_tour_positions do |t|
      t.integer :joomlaID
      t.integer :tourPosition_id
      t.datetime :startDate
      t.datetime :endDate
      t.integer :price
      t.string :createdFrom
      t.string :changedFrom
      t.integer :syncedFrom
      t.boolean :deleteFlag

      t.timestamps
    end
  end
end
