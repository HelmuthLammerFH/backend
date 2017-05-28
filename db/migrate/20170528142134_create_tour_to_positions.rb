class CreateTourToPositions < ActiveRecord::Migration[5.0]
  def change
    create_table :tour_to_positions do |t|
      t.integer :joomlaID
      t.datetime :startDate
      t.datetime :endDate
      t.string :createdFrom
      t.string :changedFrom
      t.integer :syncedFrom
      t.boolean :deleteFlag
      t.belongs_to :tour, foreign_key: true
      t.belongs_to :Tour_Position, foreign_key: true

      t.timestamps
    end
  end
end
