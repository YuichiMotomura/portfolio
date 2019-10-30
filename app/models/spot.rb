class Spot < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_one :radar, dependent: :destroy
  accepts_nested_attributes_for :photos, :radar
  belongs_to :prefecture
  belongs_to :author, class_name: 'User'

  validates :title, :text, :prefecture_id, presence: true
  validates :text, length: {maximum: 400}
  validates :title, length: {maximum: 50}
end
