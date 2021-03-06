Rails.application.routes.draw do
  devise_for :member

  resources :home, only: [:index]
  resources :members
  resources :posts
  resources :comments
  resources :vehicles, except: [:show]
  resources :polls
  resources :votes, only: [:create]
  resources :facilities, path: :contacts
  resources :categories, except: [:show]
  resources :transactions do
    member do
      get 'download_receipt'
      put 'verify_payment'
    end
  end
  resources :bookings
  resources :feedbacks
  resources :settings, except: [:show]
  resources :accounts
  resources :inventories

  match '/members/:id/change_password', to: 'members#change_password', via: :get, as: :change_password
  match '/members/:id/update_password', to: 'members#update_password', via: :put, as: :update_password
  match '/members/:id/toggle_admin', to: 'members#toggle_admin', via: :put, as: :toggle_admin
  match '/members/:id/reset_password', to: 'members#reset_password', via: :put, as: :reset_password

  match '/posts/:id/publish', to: 'posts#publish', via: :put, as: :publish_post
  match '/all_transactions', to: 'transactions#all', via: :get, as: :all_transactions
  match '/all_bookings', to: 'bookings#all', via: :get, as: :all_bookings
  match '/booking_calendar', to: 'bookings#calendar', via: :get, as: :booking_calendar
  match '/file_upload', to: 'home#file_upload', via: :post, as: :file_upload
  match '/file_remove', to: 'home#file_remove', via: :delete, as: :file_remove
  get '/financial_reports', to: 'home#financial_reports'
  get '/location', to: 'home#location'
  get '/compose_mail', to: 'home#compose_mail'
  post '/notify_mail', to: 'home#notify_mail'

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
