class UserSerializer < ActiveModel::Serializer
  include Typable

  attributes :name
end
