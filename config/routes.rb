Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'blog/statics#show', id: 'index', as: 'home_static'
  get '/about', to: 'blog/statics#show', id: 'about', as: 'about_static'

  scope '/markas' do
    # get '/categories/:category_id/posts', to: "posts#catsort", as: "categories_posts"
    get '/settings/:id', to: "settings#edit", as: "setting"
    patch '/settings/:id', to: "settings#update"
    put '/settings/:id', to: "settings#update"
  end

  namespace :markas do
    root "application#index"
    get '/login', to: "sessions#new"
    post '/login', to: "sessions#create"
    delete '/logout', to: "sessions#destroy"
    resources :posts, except: :show
    resources :categories, except: :show
  end

  namespace :blog do
    resources :posts, only: :show, path: ''
    resources :categories, only: :show
  end
end
