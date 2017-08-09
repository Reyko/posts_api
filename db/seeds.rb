json_data = File.read("#{Rails.root}/spec/fixtures/oldest_posts_first.json")
parsed_data = JSON.parse(json_data, symbolize_names: true)

parsed_data.each do |data|
  user = User.create!(name: data[:user][:name])
  post = Post.create!(content: data[:content], user: user) 

  data[:comments].each do |comment|
    user = User.create!(name: comment[:user][:name])
    Comment.create!(post: post, content: comment[:content], user: user)
  end
end
