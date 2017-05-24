Rails.application.routes.draw do
  devise_for :users
  root "homes#index"

  resources :trains do
    resources :carriages, shallow: true
  end
  resources :railway_stations do
    patch :update_position, on: :member
    patch :set_times, on: :member
  end
  resources :routes
  resource :search, only: [:show,:create]
  resources :tickets, only: [:show, :new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
