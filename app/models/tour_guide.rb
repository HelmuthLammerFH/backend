class TourGuide < ApplicationRecord
  belongs_to :user
  belongs_to :agency
end
