class AddStatusesToTour < ActiveRecord::Migration[5.0]
  def change
    add_reference :tours, :Status, foreign_key: true
  end
end
