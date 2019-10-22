class Photo < ApplicationRecord
  belongs_to :spot
  mount_uploader :image, ImageUploader

  validates :image, presence: true
end
