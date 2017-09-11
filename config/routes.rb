Rails.application.routes.draw do
  resources :blogs, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:index, :show, :create] do
    collection do
      post '/login', to: 'users#login'
    end
#    resources :blogs, only: [:create, show:]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
