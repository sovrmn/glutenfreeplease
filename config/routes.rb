Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :recipes do
    resources :doses, only: [:new, :create, :edit]
    resources :reviews, only: [:new, :create]
  end
  resources :users, except: [ :index, :destroy ]
  resources :ingredients
  resources :doses, only: [:destroy]
  resources :reviews, only: [:destroy]

end

