Rails.application.routes.draw do
  root 'pets#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :pets do
    member do
      get 'feed'
    end
  end
end
