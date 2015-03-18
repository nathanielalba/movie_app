Rails.application.routes.draw do
  get 'actors/index'

  get 'actors/show'

  get 'actors/new'

  get 'actors/edit'

  devise_for :users
	resources :movies
	resources :actors


	authenticated :user do
		root to: "movies#index", as: :authenticated_root
	end

	unauthenticated do
		root to: 'movies#welcome', as: :unauthenticated_root
	end
end
