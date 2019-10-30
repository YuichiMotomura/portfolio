class Prefecture < ApplicationRecord
  has_many :spots
  has_ancestry
end
