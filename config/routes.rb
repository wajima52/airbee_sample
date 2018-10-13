Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :rooms do
    resources :reservations, only: :create, module: :rooms
  end
end
