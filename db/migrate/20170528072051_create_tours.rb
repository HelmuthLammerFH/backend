class CreateTours < ActiveRecord::Migration[5.0]
  def change
    create_table :tours do |t|
      t.integer :joomlaID
      t.string :name
      t.integer :maxAttendees
      t.float :price
      t.datetime :startDate
      t.datetime :endDate
      t.string :createdFrom
      t.string :changedFrom
      t.integer :syncedFrom
      t.boolean :deleteFlag

      t.timestamps
    end
  end
end
