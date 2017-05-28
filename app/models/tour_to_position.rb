class TourToPosition < ApplicationRecord
  belongs_to :tour
  belongs_to :Tourposition
end
