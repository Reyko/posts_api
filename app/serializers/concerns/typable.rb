module Typable
  extend ActiveSupport::Concern

  included do
    attributes :type
  end

  def type
    object.class.to_s
  end
end
