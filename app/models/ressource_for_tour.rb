class RessourceForTour < ApplicationRecord
  belongs_to :RessourceTyp
<<<<<<< HEAD
  belongs_to :Tour
=======
  
  validates :id, :presence => true
>>>>>>> 7f3b16426d4a68dcd5142cf6587148027745addf
end
