Rails.application.routes.draw do
  namespace :management do
    root 'top#index'
    get '/login' => 'sessions#new', as: :login
    post '/session' => 'sessions#create', as: :session
    delete '/session' => 'sessions#destroy'
    resources :users, only: [ :index, :show, :new, :edit, :create, :destroy ]
    patch '/users/:id' => 'users#update'
    resources :places, only: [ :index, :show, :new, :edit, :create, :destroy ]
    patch '/places/:id' => 'places#update'
    resources :tasks, only: [ :index, :show, :new, :edit, :create, :destroy ]
    patch '/tasks/:id' => 'tasks#update'
    resources :groups, only: [ :index, :show, :new, :edit, :create, :destroy ]
    patch '/groups/:id' => 'groups#update'
    resources :projects, only: [ :index, :show, :new, :edit, :create, :destroy ]
    patch '/projects/:id' => 'projects#update'
  end
  
  namespace :staff do
    root 'top#index'
    get '/login' => 'sessions#new', as: :login
    post '/session' => 'sessions#create', as: :session
    delete '/session' => 'sessions#destroy'
    resources :tasks, only: [ :index, :show ]
    resources :results, only: [ :index, :show, :new, :edit, :create, :destroy ]
    patch '/results/:id' => 'results#update'
    resource :user, only: [ :show, :edit ]
    patch '/user' => 'users#update'
  end
  
  root 'errors#not_found'
  get '*anything' => 'errors#not_found'
end
