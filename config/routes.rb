Rails.application.routes.draw do
  
  root to: 'home#index'
  devise_for :users
  devise_scope :user do
    post 'users/guest_login', to: 'users/sessions#guest_login'
  end

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :groups
      resources :invites
      resources :users
      resources :rooms
      resources :timetables
      resources :votes
    end
  end
end
