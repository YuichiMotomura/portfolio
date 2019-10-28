class Radar < ApplicationRecord
  belongs_to :spot

  validates :retro, :rare, :insta, :emotional, :kawaii, presence: true
end
