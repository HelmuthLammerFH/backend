class AddDeleteFlagToRessourceForTours < ActiveRecord::Migration[5.0]
  def change
    add_column :ressource_for_tours, :deleteFlag, :boolean
  end
end
