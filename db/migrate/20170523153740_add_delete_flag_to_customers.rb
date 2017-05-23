class AddDeleteFlagToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :deleteFlag, :boolean
  end
end
