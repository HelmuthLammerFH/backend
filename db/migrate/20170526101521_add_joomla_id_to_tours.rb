class AddJoomlaIdToTours < ActiveRecord::Migration[5.0]
  def change
    add_column :tours, :joomlaID, :integer
  end
end
