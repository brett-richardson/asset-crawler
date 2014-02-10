ExpertSearch::Application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/processing'

  resources :domains do
    resources :pages
    resources :links
  end

  resources :pages

  root to: 'pages#home'

end
