class AddDeleteFlagToAgencies < ActiveRecord::Migration[5.0]
  def change
    add_column :agencies, :deleteFlag, :boolean
  end
end
