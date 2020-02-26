Rails.application.routes.draw do
  get 'about' => 'pages#about', as: 'about'
  get 'form' => 'posts#new'

  resources :users, only: [:new, :create]
   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   get '/', to: 'posts#index'
   post '/', to: 'posts#index'
   get 'authorized', to: 'sessions#page_requires_login'
   delete '/logout' => 'sessions#destroy'
   get '/logout' => 'sessions#destroy'

  resources :posts do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
