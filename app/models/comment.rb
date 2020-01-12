class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :comment, presence: true
  validates :comment, length: { maximum: 140 }

end
