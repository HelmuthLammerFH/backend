class AddJoomlaIdToTourGuides < ActiveRecord::Migration[5.0]
  def change
    add_column :tour_guides, :joomlaID, :integer
  end
end
