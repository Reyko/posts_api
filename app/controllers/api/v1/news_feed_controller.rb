class Api::V1::NewsFeedController < Api::V1::BaseController
  def show
    render json: posts
  end
end
