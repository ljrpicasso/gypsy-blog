GypsyBlog::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :categories

  resources :posts

  authenticated :user do
    root :to => 'posts#index'
  end
  root :to => "posts#index"
  devise_for :users
  resources :users, :only => [:show, :index]
end
