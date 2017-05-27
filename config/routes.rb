Rails.application.routes.draw do
  root "searches#show"
  devise_for :users

  resource :search, only: [:show,:create]
  resources :tickets, except: [:edit, :update]

  namespace :admin do
    root "homes#index"

    resources :trains do
      resources :carriages, shallow: true
    end

    resources :railway_stations do
      patch :update_position, on: :member
      patch :set_times, on: :member
    end

    resources :routes
    resources :tickets
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
