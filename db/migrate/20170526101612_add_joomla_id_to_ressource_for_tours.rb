class AddJoomlaIdToRessourceForTours < ActiveRecord::Migration[5.0]
  def change
    add_column :ressource_for_tours, :joomlaID, :integer
  end
end
