class AddUsersToCustomer < ActiveRecord::Migration[5.0]
  def change
    add_reference :customers, :User, foreign_key: true
  end
end
