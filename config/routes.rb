Rails.application.routes.draw do
  devise_for :member

  resources :members
  resources :posts
  resources :comments

  match '/members/:id/change_password', to: 'members#change_password', via: :get, as: :change_password
  match '/members/:id/update_password', to: 'members#update_password', via: :put, as: :update_password

  root to: 'members#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
