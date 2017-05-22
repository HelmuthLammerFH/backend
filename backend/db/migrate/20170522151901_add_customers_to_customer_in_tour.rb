class AddCustomersToCustomerInTour < ActiveRecord::Migration[5.0]
  def change
    add_reference :customer_in_tours, :Customer, foreign_key: true
  end
end
