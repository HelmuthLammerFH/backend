class CreateCustomerInTours < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_in_tours do |t|
      t.integer :joomlaID
      t.datetime :bookedDate
      t.string :participated
      t.integer :starRating
      t.string :feedbackTourGuid
      t.string :createdFrom
      t.string :changedFrom
      t.integer :syncedFrom
      t.boolean :deleteFlag

      t.timestamps
    end
  end
end
