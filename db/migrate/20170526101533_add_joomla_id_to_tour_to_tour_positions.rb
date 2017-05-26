class AddJoomlaIdToTourToTourPositions < ActiveRecord::Migration[5.0]
  def change
    add_column :tour_to_tour_positions, :joomlaID, :integer
  end
end
