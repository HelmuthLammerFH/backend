class AddToursToCustomerInTour < ActiveRecord::Migration[5.0]
  def change
    add_reference :customer_in_tours, :Tour, foreign_key: true
  end
end
