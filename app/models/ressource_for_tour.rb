class RessourceForTour < ApplicationRecord
  belongs_to :RessourceTyp
  
  validates :id, :presence => true
end
