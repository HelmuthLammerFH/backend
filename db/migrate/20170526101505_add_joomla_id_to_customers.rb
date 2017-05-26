class AddJoomlaIdToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :joomlaID, :integer
  end
end
