class AddDeleteFlagToStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :statuses, :deleteFlag, :boolean
  end
end
