class Api::V1::NewsFeedsController < ApplicationController
  def show
    render json: Post.recent
  end
end
