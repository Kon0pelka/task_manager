# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: %i[index show new destroy create update edit] do
      collection do
        delete ':record_id/remove_attachment/:attachment_id', to: 'users#remove_attachment', as: :remove_attachment
      end
    end
    resources :groups, only: %i[index show new destroy create update edit] do
      collection do
        delete ':record_id/remove_attachment/:attachment_id', to: 'groups#remove_attachment', as: :remove_attachment
      end
    end
    resources :tasks, only: %i[index show new destroy create update edit] do
      collection do
        delete ':record_id/remove_attachment/:attachment_id', to: 'tasks#remove_attachment', as: :remove_attachment
      end
    end
    resources :user_groups, only: %i[index show new destroy create update edit]

    root to: "users#index"
  end
  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :tasks
      namespace :admin do
        resources :groups do
          resources :tasks
          resources :users,         only: %i[index show] do
            post 'add_user',        to: 'users#add_user'
            post 'remove_user',     to: 'users#remove_user'
          end
        end
      end
    end
  end
  mount_devise_token_auth_for 'User', at: 'api/auth'
end
