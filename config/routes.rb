require "sidekiq/web"
Sidekiq::Web.set :sessions, false

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "page#index"

  authenticate :admin_user do
    mount Sidekiq::Web => "/admin/sidekiq"
  end
end
