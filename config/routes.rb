Rails.application.routes.draw do
  root 'pets#index'

  resources :pets do
    member do
      get 'feed'
    end
  end
end
