class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  scope :newest_first, -> { order(id: :desc) }


  def self.recent(page: 1, limit: 50)
    includes(comments: :user).newest_first.page(page).per(limit)
  end
end

