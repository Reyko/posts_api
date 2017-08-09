class Api::V1::NewsFeedsController < ApplicationController
  def show
    render json: Post.includes(comments: :user).newest_first.page(params[:page] || 1).per(50)
  end
end
