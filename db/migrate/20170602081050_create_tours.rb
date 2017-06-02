class CreateTours < ActiveRecord::Migration[5.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.integer :maxAttendees
      t.float :price
      t.datetime :startDate
      t.datetime :endDate
      t.string :createdFrom
      t.string :changedFrom
      t.integer :syncedFrom
      t.boolean :deleteFlag
      t.belongs_to :status, foreign_key: true
      t.belongs_to :Tourguide, foreign_key: true

      t.timestamps
    end
  end
end
