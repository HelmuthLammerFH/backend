class AddTourGuidesToTour < ActiveRecord::Migration[5.0]
  def change
    add_reference :tours, :tour_guide, foreign_key: true
  end
end
