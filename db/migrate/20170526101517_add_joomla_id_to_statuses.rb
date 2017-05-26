class AddJoomlaIdToStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :statuses, :joomlaID, :integer
  end
end
