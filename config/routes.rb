# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :tasks
      namespace :admin do
        resources :groups do
          resources :tasks
          resources :users
        end
      end
    end
  end
  mount_devise_token_auth_for 'User', at: 'api/auth'
end
