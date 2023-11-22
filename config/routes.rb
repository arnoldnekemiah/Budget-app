Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  unauthenticated do
    root 'groups#index', as: :unauthenticated_root
  end

  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :groups do
    resources :spendings, only: [:index, :new, :create]
  end
end
