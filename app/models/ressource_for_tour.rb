class RessourceForTour < ApplicationRecord
  belongs_to :Tour

  validates :id, :presence => true
end
