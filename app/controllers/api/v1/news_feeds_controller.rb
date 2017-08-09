class Api::V1::NewsFeedsController < Api::V1::BaseController
  def show
    render json: posts
  end
end
