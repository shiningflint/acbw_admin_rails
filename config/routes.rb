Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'blog/statics#show', id: 'index', as: 'home_static'
  get '/about', to: 'blog/statics#show', id: 'about', as: 'about_static'

  namespace :markas do
    root "application#index"
    get '/login', to: "sessions#new"
    post '/login', to: "sessions#create"
    delete '/logout', to: "sessions#destroy"
    resources :posts, except: :show
    resources :categories, except: :show
    resources :pictures, only: :index
  end

  namespace :blog do
    resources :posts, only: :show, path: ''
    resources :categories, only: :show
  end
end
