Rails.application.routes.draw do
  resources :articles
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root "articles#index"

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
# config/routes.rb
namespace :users do
  resources :admins, only: [] do
    member do
      get :approve
      get :decline
    end
  end
end
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?


  # Defines the root path route ("/")
  # root "posts#index"
end
