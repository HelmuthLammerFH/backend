class RessourceForTour < ApplicationRecord
  belongs_to :RessourceTyp
  belongs_to :Tour
end
