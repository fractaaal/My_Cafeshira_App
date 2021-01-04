Rails.application.routes.draw do
  devise_for :accounts
  delete '/shops', to: 'shops#destroy'
  root to: 'shops#home'
  resources :shops do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :new]
  end

  resources :accounts
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
