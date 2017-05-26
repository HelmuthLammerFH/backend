class AddJoomlaIdToCustomerInTours < ActiveRecord::Migration[5.0]
  def change
    add_column :customer_in_tours, :joomlaID, :integer
  end
end
