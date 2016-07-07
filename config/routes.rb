Rails.application.routes.draw do
  resources :messages
  resources :users
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  mount API::Root => '/'

  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]

  # You can have the root of your site routed with "root"
    root 'users#index'
end
