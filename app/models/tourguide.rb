class Tourguide < ApplicationRecord
  belongs_to :user
  belongs_to :agency
end
