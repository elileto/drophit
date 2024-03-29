Rails.application.routes.draw do

  get 'sessions/new'

get "avgIntensityLevel3", to: "workouts#avgIntensityLevel3"
  resources :exercises
  resources :workouts
  resources :users
  resources :profiles

  root 'workouts#index', as: 'workouts_index'

  get 'welcome' => 'pages#home'
  get 'profiles/find'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
