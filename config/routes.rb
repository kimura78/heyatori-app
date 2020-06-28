Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :groups
    end
  end
end
