Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1' do
      resources :articles
    end
  end

  # match '/api/v1/articles'                 =>    'api/v1/articles#index',              via: [:get],           as: :api_v1_articles
  # match '/api/v1/articles'                 =>    'api/v1/articles#create',             via: [:post]
  # match '/api/v1/articles/:id'             =>    'api/v1/articles#show',               via: [:get],           as: :api_v1_article
  # match '/api/v1/articles/:id'             =>    'api/v1/articles#update',             via: [:patch]
  # match '/api/v1/articles/:id'             =>    'api/v1/articles#update',             via: [:put]
  # match '/api/v1/articles/:id'             =>    'api/v1/articles#destroy',            via: [:delete]

end
