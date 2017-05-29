class Tour < ApplicationRecord
  belongs_to :status
  belongs_to :Tourguide
end
