class AddDeleteFlagToTourPositions < ActiveRecord::Migration[5.0]
  def change
    add_column :tour_positions, :deleteFlag, :boolean
  end
end
