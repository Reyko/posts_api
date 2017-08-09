class PostSerializer < ActiveModel::Serializer
  include Typable

  attributes :content

  belongs_to :user
  has_many :comments
end
