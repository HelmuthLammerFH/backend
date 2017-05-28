class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :note
      t.string :createdFrom
      t.string :changedFrom
      t.integer :syncedFrom
      t.boolean :deleteFlag
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
