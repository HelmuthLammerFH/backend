class AddToursToTourToTourPosition < ActiveRecord::Migration[5.0]
  def change
    add_reference :tour_to_tour_positions, :Tour, foreign_key: true
  end
end
