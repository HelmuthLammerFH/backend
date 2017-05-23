class AddDeleteFlagToTours < ActiveRecord::Migration[5.0]
  def change
    add_column :tours, :deleteFlag, :boolean
  end
end
