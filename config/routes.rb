Rails.application.routes.draw do
  resources :species
  resources :users
  root 'landing#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :pets do
    member do
      get 'feed'
    end
  end
end
