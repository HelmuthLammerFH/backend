class AddToursToRessourceForTour < ActiveRecord::Migration[5.0]
  def change
    add_reference :ressource_for_tours, :Tour, foreign_key: true
  end
end
