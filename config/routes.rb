Rails.application.routes.draw do
  devise_for :member

  resources :home, only: [:index]
  resources :members
  resources :posts
  resources :comments
  resources :vehicles
  resources :polls
  resources :votes, only: [:create]
  resources :facilities
  resources :transactions

  match '/members/:id/change_password', to: 'members#change_password', via: :get, as: :change_password
  match '/members/:id/update_password', to: 'members#update_password', via: :put, as: :update_password
  match '/members/:id/toggle_admin', to: 'members#toggle_admin', via: :put, as: :toggle_admin
  match '/members/:id/reset_password', to: 'members#reset_password', via: :put, as: :reset_password

  match '/posts/:id/publish', to: 'posts#publish', via: :put, as: :publish_post
  match '/all_transactions', to: 'transactions#all', via: :get, as: :all_transactions

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
