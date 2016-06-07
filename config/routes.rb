Rails.application.routes.draw do
  resources :messages
  resources :users

  mount API::Root => '/'

  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]

  # You can have the root of your site routed with "root"
    root 'users#index'
end
