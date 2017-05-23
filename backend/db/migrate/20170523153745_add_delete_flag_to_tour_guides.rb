class AddDeleteFlagToTourGuides < ActiveRecord::Migration[5.0]
  def change
    add_column :tour_guides, :deleteFlag, :boolean
  end
end
