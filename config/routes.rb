# config/routes.rb
Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  unauthenticated do
    root 'pages#splash', as: :unauthenticated_root
  end

  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :groups do
    resources :spendings, only: [:index, :new, :create]
  end

  get 'splash', to: 'pages#splash', as: 'splash'
end
