class AddJoomlaIdToAgencies < ActiveRecord::Migration[5.0]
  def change
    add_column :agencies, :joomlaID, :integer
  end
end
