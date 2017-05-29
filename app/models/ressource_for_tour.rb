class RessourceForTour < ApplicationRecord
  belongs_to :RessourceTyp
  belongs_to :Tour

  validates :id, :presence => true
end
