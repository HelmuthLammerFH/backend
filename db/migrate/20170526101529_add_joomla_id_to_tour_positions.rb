class AddJoomlaIdToTourPositions < ActiveRecord::Migration[5.0]
  def change
    add_column :tour_positions, :joomlaID, :integer
  end
end
