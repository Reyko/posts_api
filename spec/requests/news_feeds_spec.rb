require 'rails_helper'
require 'pry'

RSpec.describe 'News feed', type: :request do
  before(:all) do
    @url = "http://api.domain.com" 
  end

  before do
    Rails.application.load_seed
  end

  describe 'GET #show' do
    it 'fetches the newest posts' do
      json_data = File.read("#{Rails.root}/spec/fixtures/newest_posts_first.json")
      expected_posts = JSON.parse(json_data)

      get "#{@url}/v1/news_feed"
      result = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(result).to eq(expected_posts)
    end

    it 'returns a maximum of 50 posts at a time' do
      FactoryGirl.create_list(:post, 100)

      get "#{@url}/v1/news_feed"
      posts = JSON.parse(response.body)

      expect(posts.count).to eq(50)
    end

    it 'returns the posts from page 2' do
      expected_posts = FactoryGirl.create_list(:post, 100).last(50).pluck(:content)

      get "#{@url}/v1/news_feed", params: { page: 2 }
      posts = JSON.parse(response.body, symbolize_names: true).map! { |post| post[:content] }

      expect(posts).to eq(expected_posts)
    end
  end
end

