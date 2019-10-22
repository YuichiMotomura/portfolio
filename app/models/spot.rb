class Spot < ApplicationRecord
  has_many :photos
  has_one :radar
  accepts_nested_attributes_for :photos, :radar
  belongs_to :prefecture, optional: true

  validates :title, :text, :prefecture_id, presence: true
  validates :text, length: {maximum: 400}
  validates :title, length: {maximum: 50}
end
