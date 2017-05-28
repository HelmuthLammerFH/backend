class CreateTourGuides < ActiveRecord::Migration[5.0]
  def change
    create_table :tour_guides do |t|
      t.date :tourGuideSince
      t.string :createdFrom
      t.string :changedFrom
      t.integer :syncedFrom
      t.boolean :deleteFlag
      t.belongs_to :user, foreign_key: true
      t.belongs_to :agency, foreign_key: true

      t.timestamps
    end
  end
end
