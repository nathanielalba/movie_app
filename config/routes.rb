Rails.application.routes.draw do
  devise_for :users

  resources :search

	resources :movies do
		collection do
			get 'search', module: :movies
		end
		resources :comments, module: :movies
	end

	resources :actors do
		collection do
			get 'search'
		end
		resources :comments, module: :actors
	end

	authenticated :user do
		root to: "movies#index", as: :authenticated_root
	end

	unauthenticated do
		root to: 'movies#welcome', as: :unauthenticated_root
	end
end
