class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  scope :newest_first, -> { order(id: :desc) }
end
