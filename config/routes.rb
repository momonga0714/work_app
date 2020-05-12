Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts do
    resources :residents,only:[:create]
    collection do
      get 'search'
    end
  end
  resources :residents
end
