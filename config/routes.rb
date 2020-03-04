# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users do
    resources :events, only: [:new, :create, :edit]
    resources :posts, only: [:new, :create, :edit]
  end
  resources :events, except: [:new, :create, :edit]
  resources :posts, except: [:new, :create, :edit]
end
