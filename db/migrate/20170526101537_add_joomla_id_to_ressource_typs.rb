class AddJoomlaIdToRessourceTyps < ActiveRecord::Migration[5.0]
  def change
    add_column :ressource_typs, :joomlaID, :integer
  end
end
