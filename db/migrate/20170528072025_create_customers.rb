class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.integer :joomlaID
      t.string :note
      t.string :createdFrom
      t.string :changedFrom
      t.integer :syncedFrom
      t.boolean :deleteFlag

      t.timestamps
    end
  end
end
