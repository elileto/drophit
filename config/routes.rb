Rails.application.routes.draw do

get "avgIntensityLevel3", to: "workouts#avgIntensityLevel3"
  resources :exercises
  resources :workouts
  resources :users
  resources :profiles

  get 'welcome' => 'pages#home'
  get 'profiles/find'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
