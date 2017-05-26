class AddPictureToRessourceForTours < ActiveRecord::Migration[5.0]
  def change
    add_column :ressource_for_tours, :picture, :binary
  end
end
