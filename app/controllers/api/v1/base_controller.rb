class Api::V1::BaseController < ApplicationController

  private

  def posts
    Post.recent(page: params[:page], limit: params[:limit])
  end
end
