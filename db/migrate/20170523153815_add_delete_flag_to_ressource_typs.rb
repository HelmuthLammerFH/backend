class AddDeleteFlagToRessourceTyps < ActiveRecord::Migration[5.0]
  def change
    add_column :ressource_typs, :deleteFlag, :boolean
  end
end
