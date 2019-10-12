require 'sidekiq/web'

Rails.application.routes.draw do
  
  resources :chatareas do
    resource :chatarea_users
    resources :messages do
      get "/ping" => "messages#ping"
    end
    post "/prank" => "chatareas#prank"
  end

  namespace :admin do
      resources :users

      root to: "users#index"
  end
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  root to: 'chatareas#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
