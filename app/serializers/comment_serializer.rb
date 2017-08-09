class CommentSerializer < ActiveModel::Serializer
  include Typable

  attributes :user, :content

  # does belongs_to even works?
  def user
    UserSerializer.new(object.user)
  end
end
