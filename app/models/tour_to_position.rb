class TourToPosition < ApplicationRecord
  belongs_to :tour
  belongs_to :TourPosition
end
