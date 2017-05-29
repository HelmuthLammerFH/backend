class RessourceForTour < ApplicationRecord
  belongs_to :RessourceTyp, optional: true
  belongs_to :Tour

  validates :id, :presence => true
end
