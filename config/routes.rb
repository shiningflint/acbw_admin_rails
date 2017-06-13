Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope '/markas' do
    get '/login', to: "sessions#new", as: "new_session"
    post 'login', to: "sessions#create", as: "sessions"
    delete '/logout', to: "sessions#destroy", as: "session"
    get '/categories/:category_id/posts', to: "posts#catsort", as: "categories_posts"
    get '/settings/:id', to: "settings#edit", as: "setting"
    patch '/settings/:id', to: "settings#update"
    put '/settings/:id', to: "settings#update"
  end

  namespace :markas do
    root "application#index"
    resources :posts, :categories
  end
end
