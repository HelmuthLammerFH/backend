class AddRessourceTypsToRessourceForTour < ActiveRecord::Migration[5.0]
  def change
    add_reference :ressource_for_tours, :ressource_typ, foreign_key: true
  end
end
