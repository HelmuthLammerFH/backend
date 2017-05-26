class AddPriceToTourPositions < ActiveRecord::Migration[5.0]
  def change
    add_column :tour_positions, :price, :integer
  end
end
