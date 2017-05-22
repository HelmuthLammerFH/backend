class AddAgencysToTourGuide < ActiveRecord::Migration[5.0]
  def change
    add_reference :tour_guides, :Agency, foreign_key: true
  end
end
