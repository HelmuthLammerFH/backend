class AddUsersToTourGuide < ActiveRecord::Migration[5.0]
  def change
    add_reference :tour_guides, :User, foreign_key: true
  end
end
