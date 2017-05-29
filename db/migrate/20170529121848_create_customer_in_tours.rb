class CreateCustomerInTours < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_in_tours do |t|
      t.datetime :bookedDate
      t.integer :participated
      t.integer :starRating
      t.string :feedbackTourGuid
      t.string :createdFrom
      t.string :changedFrom
      t.integer :syncedFrom
      t.boolean :deleteFlag, :default=>false
      t.belongs_to :customer, foreign_key: true
      t.belongs_to :tour, foreign_key: true

      t.timestamps
    end
  end
end
