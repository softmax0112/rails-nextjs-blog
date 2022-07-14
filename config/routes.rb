Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show, :update, :destroy] do
        resources :posts, only: [:index, :create, :show, :update, :destroy]
      end

      resources :posts, only: [:index, :show]

      post '/login', to: 'auth#create'
      delete '/logout', to: 'auth#destroy'
    end
  end

end
