class AddDeleteFlagToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :deleteFlag, :boolean
  end
end
