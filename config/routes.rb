Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get "/markas/login", to: "sessions#new"
	post "/markas/login", to: "sessions#create"
	delete "/markas/logout", to: "sessions#destroy"

	get "/markas", to: "posts#index"

	scope '/markas' do
		resources :posts, :categories
	end
end
