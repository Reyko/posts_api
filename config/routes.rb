Rails.application.routes.draw do
  namespace :api, path: "", constraints: { subdomain: 'api' }, defaults: { format: 'json' } do
    namespace :v1 do
      resource :news_feed, only: :show, controller: 'news_feed'
    end
  end
end
