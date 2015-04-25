Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :views
  devise_for :users
  root :to => 'blogs#index'

  resources :blogs do
    resources :comments, :except =>[:show, :index]
  end

  namespace :api do
    resources :blogs, :users, defaults: {format: :json}
  end
end
