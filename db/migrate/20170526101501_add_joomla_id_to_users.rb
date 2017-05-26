class AddJoomlaIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :joomlaID, :integer
  end
end
