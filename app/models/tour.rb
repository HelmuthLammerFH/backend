class Tour < ApplicationRecord
  belongs_to :status
  belongs_to :Tourguide

  validates :id, :presence => true
end
