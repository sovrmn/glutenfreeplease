Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :recipes do
    resources :doses, only: [:new, :create, :edit]
  end
  resources :ingredients
  resources :doses, only: [:destroy]

end

