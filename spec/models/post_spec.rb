require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do 
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :comments }
  end


  describe '::recent' do
    context 'without passing a page argument' do
      it 'returns the latest 60 posts' do 
        posts = FactoryGirl.create_list(:post, 100).last(60).sort_by { |p| p.id * -1 }

        result = Post.recent(limit: 60)

        expect(result).to eq(posts)
      end
    end

    context 'without passing a limit argument' do
      it 'returns the latest 50 posts' do 
        posts = FactoryGirl.create_list(:post, 100).last(50).sort_by { |p| p.id * -1 }

        result = Post.recent

        expect(result).to eq(posts)
      end
    end


    context 'pass both a page and limit argument' do
      it 'returns the oldest 40 posts' do
        posts = FactoryGirl.create_list(:post, 100).first(40).sort_by { |p| p.id * -1 }

        result = Post.recent(page: 2, limit: 60)

        expect(result).to eq(posts)
      end
    end
  end
end
