require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers:{registrations:'users/registrations'}
  resources :items do
    member do
      patch :complete
    end
  end
  root 'items#index'
  mount Sidekiq::Web => '/sidekiq'
end
